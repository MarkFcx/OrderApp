import 'dart:async';
import 'dart:isolate';
import 'dart:typed_data';

// 通用的创建耗时任务的方法类，子Isolate之行传递的耗时操作，并将结果返回给主Isolate，然后关闭子Isolate
// operation为耗时操作，arguments为耗时操作函数所需参数
// 主子Isolate之间建立双向通信，主Isolate向子Isolate传递耗时操作和参数
// 子Isolate向主Isolate传递之行结果

class CommonIsolate {
  // 子Isolate向主Isolate传递Map数据中：发送消息的Port对应的key
  static String subIsolateSendPortKey = 'subIsolateSendPortKey';
  // 主Isolate向子Isolate传递Map数据中：耗时操作Funtion对应的key
  static String operationKey = 'operation';
  // 主Isolate向子Isolate传递Map数据中：耗时操作Fution所需参数对应的key
  static String argumentsKey = 'arguments';

  static Future<R> addIsolateTask<T, R>(
      Function(T) operation, T arguments) async {
    // 创建Completer，用于返回future
    final Completer<R> result = Completer<R>();
    // 创建主Isolate的接收Port，用于接收从子Isolate传递过来的message
    ReceivePort receivePort = ReceivePort();

    // 创建子Isolate，执行packageTask，并将sendPort作为message传递，子Isolate可以通过传递的
    // sendPort向主Isolate传递数据
    Isolate isolate =
        await Isolate.spawn<SendPort>(_packageTask, receivePort.sendPort);
    // 监听子Isolate发送过来的消息

    receivePort.listen((data) async {
      if (data is Map<String, dynamic> &&
          data.containsKey(subIsolateSendPortKey)) {
        /// 拿到子Isolate传递过来的sendPort
        SendPort sendPort = data[subIsolateSendPortKey];
        // 将参数及耗时任务通过sendPort发送给子Isolate
        Map<String, dynamic> param = {
          argumentsKey: arguments,
          operationKey: operation
        };
        sendPort.send(param);
      } else {
        result.complete(data);
        _closeIsolate(isolate, receivePort);
      }
    }, onError: (error) {
      _closeIsolate(isolate, receivePort);
    });
    return result.future;
  }

  // 子Isolate中执行的主函数
  static void _packageTask(SendPort sendPort) {
    // 创建子Isolate的接收Port，用于接收从主Isolate传递过来的data
    ReceivePort receivePort = ReceivePort();
    SendPort sendPortForMain = receivePort.sendPort;
    // 子Isolate监听从主Isolate传递过来的data
    receivePort.listen((data) {
      if (data is Map<String, dynamic> &&
          data.containsKey(operationKey) &&
          data.containsKey(argumentsKey)) {
        // 拿到耗时操作并执行
        Function callback = data[operationKey];
        // 将执行完的结果再发送给主isolate
        Future<Uint8List> result = callback(data[argumentsKey]);
        // 结果是Future<Uint8List>，必须获取Uint8List，将Uint8List发送给主Isolate
        result.then((value) {
          sendPort.send(value);
        });
      } else {
        // ignore: todo
        // TODO: 其他主Isolate向子Isolate传递过来的数据处理，目前不需要，但一个完整的
        // 双向通信，应该提供该处理的扩展
      }
    });
    // 通过子向主的发送Port，首先向主Isolate传递sendPort，使主Isolate可以向子Isolate传递数据
    sendPort.send({subIsolateSendPortKey: sendPortForMain});
  }

  // 关闭端口及isolate
  static void _closeIsolate(Isolate isolate, ReceivePort receivePort) {
    receivePort.close();
    isolate.kill(priority: Isolate.immediate);
  }
}

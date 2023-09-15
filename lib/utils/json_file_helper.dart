import 'dart:convert';
import 'dart:html'; // 导入dart:html

class JsonFileHelper {
  // 获取文件路径，适用于Web平台
  String get _localFilePath {
    return 'D:/Work/app/gapsense-main/order.json'; // 将文件名替换成你想要的名称
  }

  // 将数据保存为 JSON 文件
  void saveDataToJson(Map<String, dynamic> data) {
    final jsonData = json.encode(data);
    window.localStorage[_localFilePath] = jsonData; // 使用localStorage存储数据
  }

  // 从 JSON 文件中加载数据
  Map<String, dynamic>? loadDataFromJson() {
    final jsonData = window.localStorage[_localFilePath]; // 使用localStorage获取数据
    if (jsonData != null) {
      final Map<String, dynamic> data = json.decode(jsonData);
      return data;
    }
    return null;
  }
}

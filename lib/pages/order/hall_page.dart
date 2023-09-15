import 'package:flutter/material.dart';
import 'dart:math';

import '../../models/order_data_model.dart';
import '../../pages/order/order_page.dart';
import '../../widgets/order_input_dialog.dart';

class HallPage extends StatefulWidget {
  const HallPage({Key? key}) : super(key: key);

  @override
  _HallPageState createState() => _HallPageState();
}

class _HallPageState extends State<HallPage> {
  List<String> chineseNames = [
    '红叶舞',
    '青山樵',
    '翠峰鸣',
    '碧水潭',
    '金光瀑',
    '夜雨江',
    '白鹤云',
    '梅花雪',
    '秋风扇',
    '寒山雁',
  ];

  // 在 HallPage 中
  Map<String, OrderDataModel> buttonData = {};

  // 在 HallPage 中
  void _navigateToOrderPage(String hallName) {
    OrderDataModel? data = buttonData[hallName]; // 使用可选类型

    if (data != null) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => OrderPage(data: data),
        ),
      );
    } else {
      // 处理数据为空的情况，例如显示错误消息或采取其他操作
      showInputDialog(context, hallName);
    }
  }

  Future<void> showInputDialog(BuildContext context, String hallName) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return OrderInputDialog(hallName: hallName);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hall Page'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 6, // 每行三个按钮
        ),
        itemCount: chineseNames.length, // 限制按钮的数量
        itemBuilder: (context, index) {
          // 获取中国风名字
          String chineseName = chineseNames[index];

          // 创建普通按钮
          return ElevatedButton(
            onPressed: () {
              // 导航到OrderPage并传递按钮的文本内容
              _navigateToOrderPage(chineseName);
            },
            child: Text(chineseName),
          );
        },
      ),
    );
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../models/order_data_model.dart';
import '../../utils/json_file_helper.dart';
import '../../widgets/custom_image_button.dart';
import '../../widgets/custom_order_tile_button.dart';

class OrderPage extends StatefulWidget {
  final OrderDataModel? data;

  const OrderPage({Key? key, this.data}) : super(key: key);

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  List<CustomOrderTileButton> selectedTitles = []; // 存储选中按钮
  List<String> selectedTitlesName = []; // 重复性检查用的

  // 初始化 selectedTitlesName
  @override
  void initState() {
    super.initState();
    if (widget.data != null && widget.data!.orderList != null) {
      for (String item in widget.data!.orderList!) {
        selectedTitlesName.add(item);
        selectedTitles.add(
          CustomOrderTileButton(
            title: item,
            info: "",
            unit: "",
            price: 0,
            onPressed: () {
              // 处理按钮点击事件
              // 单子列表中当前选中的
            },
          ),
        );
      }
    }
  }

  String title = "罗森";
  String unit = "例";
  int price = 368;

  void addToSelectedTitles(String title, String unit, int price) {
    setState(() {
      if (!selectedTitlesName.contains(title)) {
        sendToBackend(title, unit, price);

        widget.data!.orderList.add(title);
        selectedTitlesName.add(title);
        selectedTitles.add(
          CustomOrderTileButton(
            title: title,
            info: "",
            unit: unit,
            price: price,
            onPressed: () {
              // 处理按钮点击事件
              // 单子列表中当前选中的
            },
          ),
        );
      }
    });
  }

  void sendToBackend(String title, String unit, int price) async {
    if (!selectedTitlesName.contains(title)) {
      final url = Uri.parse('http://127.0.0.1:5000/api/orders'); // 替换为你的后端URL
      final orderData = {
        'hallName': widget.data!.hallName,
        'startTime': DateTime.now().toIso8601String(),
        'numberOfDiners': widget.data!.numberOfDiners,
        'dishPreparation': widget.data!.dishPreparation,
        'priority': widget.data!.priority,
        'orderList': [...widget.data!.orderList, title],
        'totalAmount': widget.data!.totalAmount + price,
      };

      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(orderData),
      );

      if (response.statusCode == 201) {
        print("订单添加成功，可以更新UI或执行其他操作");
        // 订单添加成功，可以更新UI或执行其他操作
      } else {
        // 处理错误，例如显示错误消息
      }
    }
  }

  ButtonStyle elevatedButtonStyle = ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.zero, // 设置为零以使按钮具有直角形状
    ),
    // 添加其他按钮样式属性，如颜色、文本样式等
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: Text('选择'),
          ),
      body: Row(
        children: <Widget>[
          // 左侧区域
          Expanded(
            flex: 5,
            child: Column(
              children: [
                // 左上单子标题区域
                Expanded(
                  flex: 2,
                  child: Container(
                    color: Color.fromARGB(255, 97, 97, 97),
                    // 这里放置上方的内容
                  ),
                ),
                // 左中单子内容区域
                Expanded(
                  flex: 8,
                  child: Container(
                    color: Color.fromARGB(255, 139, 139, 139),
                    child: ListView.builder(
                      itemCount: selectedTitles.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: selectedTitles[index],
                        );
                      },
                    ),
                  ),
                ),
                // 左下button区域
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Color.fromARGB(255, 98, 99, 99),
                    // 这里放置下方的内容
                  ),
                ),
              ],
            ),
          ),
          // 中间按钮区域
          Expanded(
            flex: 1,
            child: ListView(
              // shrinkWrap: false, // 让ListView占据所需的空间
              children: [
                // 这里放置右侧区域的按钮
                ElevatedButton(
                  style: elevatedButtonStyle, // 应用统一的风格
                  child: Text("赠"),
                  onPressed: () {},
                ),
                ElevatedButton(
                  style: elevatedButtonStyle,
                  child: Text("退"),
                  onPressed: () {},
                ),
                ElevatedButton(
                  style: elevatedButtonStyle,
                  child: Text("删"),
                  onPressed: () {},
                ),
                ElevatedButton(
                  style: elevatedButtonStyle,
                  child: Text("+"),
                  onPressed: () {},
                ),
                ElevatedButton(
                  style: elevatedButtonStyle,
                  child: Text("-"),
                  onPressed: () {},
                ),
                ElevatedButton(
                  style: elevatedButtonStyle,
                  child: Text("改量"),
                  onPressed: () {},
                ),
                ElevatedButton(
                  style: elevatedButtonStyle,
                  child: Text("改价"),
                  onPressed: () {},
                ),
                ElevatedButton(
                  style: elevatedButtonStyle,
                  child: Text("打折"),
                  onPressed: () {},
                ),
                ElevatedButton(
                  style: elevatedButtonStyle,
                  child: Text("要求"),
                  onPressed: () {},
                ),
                ElevatedButton(
                  style: elevatedButtonStyle,
                  child: Text("加急"),
                  onPressed: () {},
                ),
                ElevatedButton(
                  style: elevatedButtonStyle,
                  child: Text("打包"),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          // 右侧区域
          Expanded(
            flex: 15,
            child: Container(
              color: Color.fromARGB(255, 131, 131, 131), // 右侧区域的背景颜色
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 每行最多显示5个按钮
                  childAspectRatio: 2.0 / 1.0, // 设置宽高比为2：1
                ),
                itemCount: 5, // 一共放11个按钮
                itemBuilder: (BuildContext context, int index) {
                  // 基于 index 创建 CustomImageButton
                  return CustomImageButton(
                    imagePath: 'assets/a.png', // 图片路径
                    title: title + ' ${index + 1}', // 照片标题
                    unit: unit, // 照片标题
                    price: price, // 描述
                    onPressed: () {
                      // 处理按钮点击事件
                      // 将标题添加到左侧区域的列表
                      addToSelectedTitles(title + '${index + 1}', unit, price);
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

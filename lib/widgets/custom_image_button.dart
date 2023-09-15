import 'package:flutter/material.dart';

class CustomImageButton extends StatelessWidget {
  final String imagePath;
  final String title;
  final String unit;
  final int price;
  final VoidCallback onPressed;

  CustomImageButton({
    required this.imagePath,
    required this.title,
    required this.unit,
    required this.price,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(16.0),
      ),
      child: AspectRatio(
        aspectRatio: 2.0 / 1.0, // 宽2，高1
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 2,
              child:  Image.asset(
                imagePath,
                fit: BoxFit.fill, // 使用cover以填充父级容器
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // 照片标题
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0), // 添加一些间距
                  // 描述
                  Text(
                    price.toString(),
                    style: TextStyle(fontSize: 16.0),
                  ),
                  SizedBox(height: 8.0), // 添加一些间距
                  // 十字加号按钮
                  Icon(
                    Icons.add_circle,
                    size: 40.0,
                    color: Color.fromARGB(255, 238, 5, 5), // 可以根据你的需求更改颜色
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

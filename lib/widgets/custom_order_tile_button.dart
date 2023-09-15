import 'package:flutter/material.dart';

class CustomOrderTileButton extends StatelessWidget {
  final String title;
  final String info;
  final String unit;
  final int price;
  final VoidCallback onPressed;
  List<int> aspect = [2, 1, 1, 1];

  CustomOrderTileButton({
    required this.title,
    required this.info,
    required this.unit,
    required this.price,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0, // 设置高度为40px
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: Color.fromARGB(255, 7, 7, 7),
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          padding:
              EdgeInsets.only(left: 10.0, right: 10.0, top: 1.0, bottom: 1.0),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: aspect[0],
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              flex: aspect[1],
              child: Text(
                info,
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              flex: aspect[2],
              child: Text(
                unit,
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            Expanded(
              flex: aspect[3],
              child: Text(
                price.toString(),
                style: TextStyle(fontSize: 16.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

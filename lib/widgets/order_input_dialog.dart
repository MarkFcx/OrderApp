import 'package:flutter/material.dart';
import '../models/order_data_model.dart';
import '../pages/order/order_page.dart';

class OrderInputDialog extends StatefulWidget {
  final String hallName;

  const OrderInputDialog({Key? key, required this.hallName}) : super(key: key);

  @override
  _OrderInputDialogState createState() => _OrderInputDialogState();
}

class _OrderInputDialogState extends State<OrderInputDialog> {
  int? numberOfDiners;
  bool? dishPreparation;
  int? priority;
  Map<String, OrderDataModel> buttonData = {};

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Enter Information'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextField(
            onChanged: (value) {
              setState(() {
                numberOfDiners = int.tryParse(value);
              });
            },
            decoration: InputDecoration(labelText: 'Number of Diners'),
          ),
          SizedBox(height: 16),
          CheckboxListTile(
            title: Text('Dish Preparation'),
            value: dishPreparation ?? false,
            onChanged: (value) {
              setState(() {
                dishPreparation = value;
              });
            },
          ),
          SizedBox(height: 16),
          TextField(
            onChanged: (value) {
              setState(() {
                priority = int.tryParse(value);
              });
            },
            decoration: InputDecoration(labelText: 'Priority'),
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            if (numberOfDiners != null && priority != null) {
              final OrderDataModel newData = OrderDataModel(
                hallName: widget.hallName,
                startTime: DateTime.now(),
                numberOfDiners: numberOfDiners!,
                dishPreparation: dishPreparation ?? false,
                priority: priority!,
                orderList: [],
                totalAmount: 0.0,
              );

              // Add the new data to buttonData
              buttonData[widget.hallName] = newData;

              Navigator.of(context).pop(); // Close the dialog
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => OrderPage(data: newData),
                ),
              );
            }
          },
          child: Text('Confirm'),
        ),
      ],
    );
  }
}

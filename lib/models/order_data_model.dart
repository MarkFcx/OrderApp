class OrderDataModel {
  final String hallName;
  final DateTime startTime; // 开台时间
  final int numberOfDiners; // 就餐人数
  final bool dishPreparation; // 起菜状态
  final int priority; // 上菜优先级
  final List<String> orderList; // 下单列表
  final double totalAmount; // 总金额

  OrderDataModel({
    required this.hallName,
    required this.startTime,
    required this.numberOfDiners,
    required this.dishPreparation,
    required this.priority,
    required this.orderList,
    required this.totalAmount,
  });
}

// class OrderDataModel {
//   DateTime? startTime; // 开台时间
//   int? numberOfDiners; // 就餐人数
//   bool? dishPreparation; // 起菜状态
//   int? priority; // 上菜优先级
//   List<String>? orderList; // 下单列表
//   double? totalAmount; // 总金额

//   OrderDataModel();
// }

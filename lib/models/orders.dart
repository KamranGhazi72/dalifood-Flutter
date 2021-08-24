class Order {
  String id;
  int valueId;
  String userId;
  String status;
  int totalPrice;
  DateTime createDate;
  String address;
  int addressId;
  List<OrderItemsValue> orderItems;

  Order({
    required this.id,
    required this.valueId,
    required this.userId,
    required this.status,
    required this.totalPrice,
    required this.createDate,
    required this.address,
    required this.addressId,
    required this.orderItems,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["\u0024id"],
        valueId: json["id"],
        userId: json["userId"],
        status: json["status"],
        totalPrice: json["totalPrice"],
        createDate: DateTime.parse(json["createDate"]),
        address: json["address"],
        addressId: json["addressId"],
        orderItems: List<OrderItemsValue>.from(
            json["\u0024values"].map((x) => OrderItemsValue.fromJson(x))),
      );
}

class OrderItemsValue {
  String id;
  int valueId;
  int orderId;
  String customerProductName;
  String customerName;
  int price;
  int count;
  int status;
  DateTime createDate;
  
  OrderItemsValue({
    required this.id,
    required this.valueId,
    required this.orderId,
    required this.customerProductName,
    required this.customerName,
    required this.price,
    required this.count,
    required this.status,
    required this.createDate,
  });

  factory OrderItemsValue.fromJson(Map<String, dynamic> json) =>
      OrderItemsValue(
        id: json["\u0024id"],
        valueId: json["id"],
        orderId: json["orderId"],
        customerProductName: json["customerProductName"],
        customerName: json["customerName"],
        price: json["price"],
        count: json["count"],
        status: json["status"],
        createDate: DateTime.parse(json["createDate"]),
      );
}

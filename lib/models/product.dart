class Product {
  int id;
  int customerTypeId;
  String productName;
  int productTypeId;
  String productType;
  String description;
  int customerId;
  String customerName;
  int price;
  int? priceWithDiscount;
  int sendingPrice;
  String imageAddress;
  int rate;

  Product({
    required this.id,
    required this.customerTypeId,
    required this.productName,
    required this.productTypeId,
    required this.productType,
    required this.description,
    required this.customerId,
    required this.customerName,
    required this.price,
    this.priceWithDiscount,
    required this.sendingPrice,
    required this.imageAddress,
    required this.rate,
  });

  factory Product.fromJson(Map<String, dynamic> parsedJson) {
    return Product(
      id: parsedJson['id'],
      customerTypeId: parsedJson['customerTypeId'],
      productName: parsedJson['productName'],
      productTypeId: parsedJson['productTypeId'],
      productType: parsedJson['productType'],
      description: parsedJson['description'],
      customerId: parsedJson['customerId'],
      customerName: parsedJson['customerName'],
      price: parsedJson['price'],
      priceWithDiscount: parsedJson['priceWithDiscount'],
      sendingPrice: parsedJson['sendingPrice'],
      imageAddress: parsedJson['imageAddress'],
      rate: parsedJson['rate'],
    );
  }
}

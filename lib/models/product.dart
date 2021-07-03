class Product {
  int id;
  String resturantName;
  String foodName;
  String foodDesc;
  double price;
  double? offerPrice;
  double peykPrice;
  List<String> img;

  Product({
    required this.id,
    required this.resturantName,
    required this.foodName,
    required this.foodDesc,
    required this.price,
    this.offerPrice,
    required this.peykPrice,
    required this.img,
  });
}

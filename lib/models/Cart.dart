import 'dart:ffi';

class Cart {
  int id;
  String title;
  double price;
  String img;
  int numOfItem;

  Cart({
    required this.id,
    required this.title,
    required this.price,
    required this.img,
    required this.numOfItem,
  });
}

List<Cart> cartsList = [
  Cart(
    id: 0,
    title: 'کباب ترش',
    price: 38000.0,
    img: 'assets/images/kabab2.jpg',
    numOfItem: 2,
  ),
  Cart(
    id: 2,
    title: 'پیتزا مارگاریتا',
    price: 48000.0,
    img: 'assets/images/pizza1.jpg',
    numOfItem: 1,
  ),
  Cart(
    id: 3,
    title: 'نوشابه کوکاکولا',
    price: 13000.0,
    img: 'assets/images/ic_soft_drink.png',
    numOfItem: 1,
  ),
];

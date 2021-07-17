class Drink {
  int id;
  String drinkName;
  double price;
  double? offerPrice;
  String img;

  Drink({
    required this.id,
    required this.drinkName,
    required this.price,
    this.offerPrice,
    required this.img,
  });
}

List<Drink> demoDrink = [
  Drink(
      id: 0,
      drinkName: 'کوکاکولا',
      price: 13000,
      offerPrice: 9000,
      img: 'assets/images/cocaCola.jpg'),
  Drink(
      id: 0,
      drinkName: 'فانتا',
      price: 13000,
      offerPrice: 9000,
      img: 'assets/images/fanta.jpg'),
  Drink(
      id: 0,
      drinkName: 'نوشابه کوچک',
      price: 13000,
      offerPrice: 9000,
      img: 'assets/images/littleCoca.jpg'),
  Drink(
      id: 0,
      drinkName: 'نوشابه قوطی',
      price: 13000,
      offerPrice: 9000,
      img: 'assets/images/littleSoft.jpg'),
  Drink(
      id: 0,
      drinkName: 'دوغ',
      price: 13000,
      offerPrice: 9000,
      img: 'assets/images/doogh.png'),
];

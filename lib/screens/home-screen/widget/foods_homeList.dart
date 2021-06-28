import 'package:dali_food/screens/cart-screen/cart_screen.dart';
import 'package:dali_food/screens/category-screen/category_screen.dart';
import 'package:flutter/material.dart';

class FoodsHomeList extends StatelessWidget {
  String nameTopic;
  String catLinkName;

  FoodsHomeList({
    Key? key,
    required this.nameTopic,
    required this.catLinkName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width * 0.8,
      padding: EdgeInsets.all(5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    nameTopic,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CategoryScreen(),
                        ),
                      );
                    },
                    child: Text(
                      'بازم هست',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: ListView(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              children: <Widget>[
                FoodBox(
                  id: 0,
                  resturantName: 'ایتالین',
                  foodName: 'پیتزا مارگاریتا',
                  foodDesc: 'گوشت راسته، قارچ، پنیر فلفل، ژامبون گوشت، ذرت',
                  price: 23000,
                  offerPrice: 18000,
                  peykPrice: 1500,
                  img: 'assets/images/berger3.png',
                ),
                FoodBox(
                  id: 0,
                  resturantName: 'علی بابا',
                  foodName: 'کباب ترش',
                  foodDesc: 'گوشت راسته، قارچ، پنیر فلفل، ژامبون گوشت، ذرت',
                  price: 23000,
                  offerPrice: 18000,
                  peykPrice: 1500,
                  img: 'assets/images/kabab2.jpg',
                ),
                FoodBox(
                  id: 0,
                  resturantName: 'ایتالین',
                  foodName: 'پیتزا مارگاریتا',
                  foodDesc: 'گوشت راسته، قارچ، پنیر فلفل، ژامبون گوشت، ذرت',
                  price: 23000,
                  peykPrice: 1500,
                  img: 'assets/images/pizza1.jpg',
                ),
                FoodBox(
                  id: 0,
                  resturantName: 'ایتالین',
                  foodName: 'پیتزا مارگاریتا',
                  foodDesc: 'گوشت راسته، قارچ، پنیر فلفل، ژامبون گوشت، ذرت',
                  price: 23000,
                  offerPrice: 18000,
                  peykPrice: 1500,
                  img: 'assets/images/berger1.jpg',
                ),
                FoodBox(
                  id: 0,
                  resturantName: 'ایتالین',
                  foodName: 'پیتزا مارگاریتا',
                  foodDesc: 'گوشت راسته، قارچ، پنیر فلفل، ژامبون گوشت، ذرت',
                  price: 23000,
                  peykPrice: 1500,
                  img: 'assets/images/kabab3.jpg',
                ),
                FoodBox(
                  id: 0,
                  resturantName: 'ایتالین',
                  foodName: 'پیتزا مارگاریتا',
                  foodDesc: 'گوشت راسته، قارچ، پنیر فلفل، ژامبون گوشت، ذرت',
                  price: 23000,
                  offerPrice: 18000,
                  peykPrice: 1500,
                  img: 'assets/images/kabab1.jpg',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FoodBox extends StatelessWidget {
  int id;
  String resturantName;
  String foodName;
  String foodDesc;
  double price;
  double? offerPrice;
  double peykPrice;
  String img;

  FoodBox(
      {Key? key,
      required this.id,
      required this.resturantName,
      required this.foodName,
      required this.foodDesc,
      required this.price,
      this.offerPrice,
      required this.peykPrice,
      required this.img})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CartScreen(),
          ),
        );
      },
      child: Container(
        height: MediaQuery.of(context).size.width * 0.8,
        width: MediaQuery.of(context).size.width * 0.51,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
        ),
        margin: EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 5,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(6),
                    topRight: Radius.circular(6),
                  ),
                  image: DecorationImage(
                      image: AssetImage(img), fit: BoxFit.cover),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      resturantName,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          foodName,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        offerPrice != null
                            ? Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${price.toInt()}',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          decoration:
                                              TextDecoration.lineThrough,
                                          color: Colors.red[900],
                                        ),
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        'تومن',
                                        style: TextStyle(
                                          color: Colors.black45,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${offerPrice}',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.green[900],
                                        ),
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        'تومن',
                                        style: TextStyle(
                                          color: Colors.black45,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            : Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    '${price.toInt()}',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green[900],
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    'تومن',
                                    style: TextStyle(
                                      color: Colors.black45,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.sports_motorsports_outlined,
                          color: Color(0xFFe91e63),
                        ),
                        SizedBox(width: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '${peykPrice.toInt()}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(width: 5),
                            Text(
                              'تومن',
                              style: TextStyle(
                                color: Colors.black45,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:dali_food/screens/address-screen/address_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:dali_food/controllers/cart_controller.dart';
import 'package:dali_food/models/drink.dart';
import 'package:dali_food/models/product.dart';
import 'package:dali_food/screens/foodDesc-screen/widget/fDesc_header.dart';
import 'package:dali_food/screens/foodDesc-screen/widget/fDesc_name.dart';

class FoodDescScreen extends StatefulWidget {
  int productId;
  String productResturantName;
  String productFoodName;
  String productDesc;
  int productPrice;
  int? productOfferPrice;
  int productPeykPrice;
  String productImg;
  final Product product;

  FoodDescScreen({
    Key? key,
    required this.productId,
    required this.productResturantName,
    required this.productFoodName,
    required this.productDesc,
    required this.productPrice,
    this.productOfferPrice,
    required this.productPeykPrice,
    required this.productImg,
    required this.product,
  }) : super(key: key);

  @override
  _FoodDescScreenState createState() => _FoodDescScreenState();
}

class _FoodDescScreenState extends State<FoodDescScreen> {
  int counterBuy = 0;
  var drinkChoised;
  int _borderColor = 1000;
  bool _isButtonDisabled = false;

  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    print('drinkChoised::: $drinkChoised');
    print('product::: ${widget.product}');
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            FDescHeader(img: widget.productImg),
            FDescName(
              resturantName: widget.productResturantName,
              foodName: widget.productFoodName,
              price: widget.productPrice,
              offerPrice: widget.productOfferPrice,
              peykPrice: widget.productPeykPrice,
            ),
            Container(
              padding: EdgeInsets.only(left: 20),
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        counterBuy++;
                        _isButtonDisabled = true;
                      });
                    },
                    icon: Icon(Icons.add_box_outlined),
                    iconSize: 37,
                    color: Color(0xFFe91e63),
                  ),
                  SizedBox(width: 10),
                  Text(
                    '$counterBuy',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 10),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          if (counterBuy > 0) {
                            counterBuy--;
                          } else {
                            counterBuy = 0;
                            _isButtonDisabled = false;
                          }
                        });
                      },
                      icon: Icon(Icons.indeterminate_check_box_outlined),
                      iconSize: 37,
                      color: Colors.black54),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 250,
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: demoDrink.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      setState(() => _borderColor = index);
                      drinkChoised = demoDrink[index];
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.width * 0.8,
                      width: MediaQuery.of(context).size.width / 2.5,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6),
                          border: _borderColor == index
                              ? Border.all(width: 1, color: Colors.greenAccent)
                              : Border.all(width: 1, color: Color(0xFFEEEEEE))),
                      margin: EdgeInsets.all(5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 6,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(6),
                                  topRight: Radius.circular(6),
                                ),
                                image: DecorationImage(
                                    image: AssetImage(demoDrink[index].img),
                                    fit: BoxFit.contain),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    demoDrink[index].drinkName,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.end,
                                    children: [
                                      demoDrink[index].offerPrice != null
                                          ? Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      '${demoDrink[index].price.toInt()}',
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        decoration:
                                                            TextDecoration
                                                                .lineThrough,
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
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      '${demoDrink[index].offerPrice}',
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color:
                                                            Colors.green[900],
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  '${demoDrink[index].price.toInt()}',
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
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
          padding: EdgeInsets.all(8.0),
          child: _isButtonDisabled
              ? ElevatedButton(
                  onPressed: () {
                    cartController.addToCart(
                        widget.product, drinkChoised, counterBuy);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddressScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(),
                  child: Text('افزودن به سبد خرید'),
                )
              : null),
    );
  }
}

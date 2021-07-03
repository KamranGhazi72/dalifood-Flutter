import 'package:flutter/material.dart';

import 'package:dali_food/screens/foodDesc-screen/widget/fDesc_body.dart';

class FoodDescScreen extends StatefulWidget {
  int proId;
  String proResturantName;
  String proFoodName;
  double proPrice;
  double? proOfferPrice;
  double proPeykPrice;
  List<String> proImg;
  FoodDescScreen({
    Key? key,
    required this.proId,
    required this.proResturantName,
    required this.proFoodName,
    required this.proPrice,
    this.proOfferPrice,
    required this.proPeykPrice,
    required this.proImg,
  }) : super(key: key);

  @override
  _FoodDescScreenState createState() => _FoodDescScreenState();
}

class _FoodDescScreenState extends State<FoodDescScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FoodDescBody(
        productId: widget.proId,
        productResturantName: widget.proResturantName,
        productFoodName: widget.proFoodName,
        productPrice: widget.proPrice,
        productOfferPrice: widget.proOfferPrice,
        productPeykPrice: widget.proPeykPrice,
        productImg: widget.proImg,
      ),
    );
  }
}

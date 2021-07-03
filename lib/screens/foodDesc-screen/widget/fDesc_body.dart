import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:dali_food/controllers/product_controller.dart';
import 'package:dali_food/screens/foodDesc-screen/widget/fDesc_header.dart';
import 'package:dali_food/screens/foodDesc-screen/widget/fDesc_name.dart';

class FoodDescBody extends StatefulWidget {
  int productId;
  String productResturantName;
  String productFoodName;
  double productPrice;
  double? productOfferPrice;
  double productPeykPrice;
  List<String> productImg;
  FoodDescBody({
    Key? key,
    required this.productId,
    required this.productResturantName,
    required this.productFoodName,
    required this.productPrice,
    this.productOfferPrice,
    required this.productPeykPrice,
    required this.productImg,
  }) : super(key: key);

  @override
  _FoodDescBodyState createState() => _FoodDescBodyState();
}

class _FoodDescBodyState extends State<FoodDescBody> {
  int counterBuy = 0;
  // final productsController = Get.put(ProductsController());
  @override
  Widget build(BuildContext context) {
    print('proId: ${widget.productId}');
    print('counterBuy: $counterBuy');

    return SingleChildScrollView(
      child: Column(
        children: [
          FDescHeader(img: widget.productImg),
          FDescName(resturantName: widget.productResturantName),
          Container(
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      counterBuy++;
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
                        }
                      });
                    },
                    icon: Icon(Icons.indeterminate_check_box_outlined),
                    iconSize: 37,
                    color: Colors.black54),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

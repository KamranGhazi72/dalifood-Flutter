import 'package:dali_food/controllers/cart_controller.dart';
import 'package:dali_food/screens/cart-screen/widget/cart_body.dart';
import 'package:dali_food/screens/cart-screen/widget/check_out_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  final CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF535353),
        centerTitle: true,
        title: Column(
          children: [
            Text('سبد خرید',
                style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
            // Text('${demoCarts.length} آیتم',
            //     style: TextStyle(
            //         fontSize: 13,
            //         fontWeight: FontWeight.bold,
            //         color: Colors.black38)),
          ],
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined),
          onPressed: () {
            cartController.deleteAllFromCart();
            Navigator.pop(context);
          },
        ),
      ),
      body: Body(),
      bottomNavigationBar: CheckoutCard(),
    );
  }
}

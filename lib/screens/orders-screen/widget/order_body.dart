import 'package:dali_food/screens/orders-screen/widget/older_order.dart';
import 'package:flutter/material.dart';

class OrderBody extends StatelessWidget {
  const OrderBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.95,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('سفارش فعال'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green[600],
                    // padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                    textStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              OlderOrder(status: false),
              OlderOrder(status: true),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
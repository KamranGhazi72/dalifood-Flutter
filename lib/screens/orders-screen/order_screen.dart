import 'package:dali_food/enums.dart';
import 'package:dali_food/screens/orders-screen/widget/order_body.dart';
import 'package:dali_food/widgets/coustom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrderBody(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.orders),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFe91e63),
        child: Icon(Icons.map_outlined),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

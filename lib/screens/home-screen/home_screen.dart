import 'package:dali_food/enums.dart';
import 'package:dali_food/screens/home-screen/widget/home_body.dart';
import 'package:dali_food/widgets/coustom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeBody(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFe91e63),
        child: Icon(Icons.map_outlined),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

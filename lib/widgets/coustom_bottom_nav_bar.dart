import 'package:dali_food/enums.dart';
import 'package:dali_food/screens/home-screen/home_screen.dart';
import 'package:dali_food/screens/orders-screen/order_screen.dart';
import 'package:dali_food/screens/profile-screen/profile_screen.dart';
import 'package:dali_food/screens/search-screen/search_screen.dart';
import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    Key? key,
    required this.selectedMenu,
  }) : super(key: key);

  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    final Color inActiveIconColor = Color(0xFF989898);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            spreadRadius: 50,
            color: Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(
                  Icons.storefront,
                  color: MenuState.home == selectedMenu
                      ? Color(0xFFe91e63)
                      : inActiveIconColor,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                  );
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.manage_search_outlined,
                  color: MenuState.search == selectedMenu
                      ? Color(0xFFe91e63)
                      : inActiveIconColor,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SearchScreen(),
                    ),
                  );
                },
              ),
              SizedBox(width: 33),
              IconButton(
                icon: Icon(
                  Icons.pending_actions_outlined,
                  color: MenuState.orders == selectedMenu
                      ? Color(0xFFe91e63)
                      : inActiveIconColor,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OrderScreen(),
                    ),
                  );
                },
              ),
              IconButton(
                  icon: Icon(
                    Icons.person_outline,
                    color: MenuState.profile == selectedMenu
                        ? Color(0xFFe91e63)
                        : inActiveIconColor,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfileScreen(),
                      ),
                    );
                  }),
            ],
          )),
    );
  }
}

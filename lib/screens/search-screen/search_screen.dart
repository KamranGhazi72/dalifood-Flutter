import 'package:dali_food/enums.dart';
import 'package:dali_food/screens/search-screen/widget/search_body.dart';
import 'package:dali_food/screens/search-screen/widget/search_input.dart';
import 'package:dali_food/widgets/coustom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: 50,
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFFFCFCFC),
        elevation: 0,
        actions: [
          SearchInput(),
        ],
      ),
      body: SearchBody(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.search),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFe91e63),
        child: Icon(Icons.map_outlined),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

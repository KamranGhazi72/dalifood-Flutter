import 'package:dali_food/screens/search-screen/widget/cat_menu.dart';
import 'package:dali_food/screens/search-screen/widget/search_content.dart';
import 'package:flutter/material.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CatMenuWidget(),
          SizedBox(height: 15),
          SearchContent(),
        ],
      ),
    );
  }
}

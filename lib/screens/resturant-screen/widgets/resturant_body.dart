import 'package:dali_food/screens/resturant-screen/widgets/resturant_food.dart';
import 'package:dali_food/screens/resturant-screen/widgets/resturant_header.dart';
import 'package:dali_food/screens/resturant-screen/widgets/resturant_title.dart';
import 'package:flutter/material.dart';

class ResturantBody extends StatefulWidget {
  const ResturantBody({ Key? key }) : super(key: key);

  @override
  _ResturantBodyState createState() => _ResturantBodyState();
}

class _ResturantBodyState extends State<ResturantBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ResturantHeader(),
          ResturantTitle(),
          SizedBox(height: 60),
          ResturantFood(),
        ],
      ),
    );
  }
}
import 'package:dali_food/screens/resturantDesc-screen/widget/address_desc.dart';
import 'package:dali_food/screens/resturantDesc-screen/widget/comment_desc.dart';
import 'package:dali_food/screens/resturantDesc-screen/widget/header_desc.dart';
import 'package:flutter/material.dart';

class RDescBody extends StatelessWidget {
  const RDescBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Color(0xFFEEEEEE),
                  blurRadius: 3,
                  spreadRadius: 3,
                ),
              ],
            ),
            child: Column(
              children: [
                HeaderDesc(),
                SizedBox(height: 20),
                AddressDesc(),
                SizedBox(height: 5),
              ],
            ),
          ),
          SizedBox(height: 15),
          CommentDesc(),
        ],
      ),
    );
  }
}

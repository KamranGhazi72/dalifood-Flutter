import 'package:dali_food/screens/resturantDesc-screen/widget/address_desc.dart';
import 'package:dali_food/screens/resturantDesc-screen/widget/comment_desc.dart';
import 'package:dali_food/screens/resturantDesc-screen/widget/header_desc.dart';
import 'package:flutter/material.dart';

class RDescBody extends StatelessWidget {
  String name;
  String type;
  String latitude;
  String longitude;
  String? city;
  String address;
  String? description;

  RDescBody({
    Key? key,
    required this.name,
    required this.type,
    required this.latitude,
    required this.longitude,
    this.city,
    required this.address,
    this.description,
  }) : super(key: key);

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
                HeaderDesc(
                  name: name,
                  type: type,
                  description: description,
                ),
                SizedBox(height: 20),
                AddressDesc(
                  latitude: latitude,
                  longitude: longitude,
                  address: address,
                ),
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

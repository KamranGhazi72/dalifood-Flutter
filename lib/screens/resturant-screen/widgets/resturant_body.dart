import 'package:dali_food/screens/resturant-screen/widgets/resturant_food.dart';
import 'package:dali_food/screens/resturant-screen/widgets/resturant_header.dart';
import 'package:dali_food/screens/resturant-screen/widgets/resturant_title.dart';
import 'package:flutter/material.dart';

class ResturantBody extends StatelessWidget {
  String name;
  String type;
  String latitude;
  String longitude;
  String? city;
  String address;
  int sendingPrice;
  String? description;
  bool isInMyFavorite;
  int rate;
  int distance;
  String? imageAddress;

  ResturantBody({
    Key? key,
    required this.name,
    required this.type,
    required this.latitude,
    required this.longitude,
    this.city,
    required this.address,
    required this.sendingPrice,
    this.description,
    required this.isInMyFavorite,
    required this.rate,
    required this.distance,
    this.imageAddress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ResturantHeader(imageAddress: imageAddress),
          ResturantTitle(
            name: name,
            type: type,
            latitude: latitude,
            longitude: longitude,
            address: address,
            sendingPrice: sendingPrice,
            isInMyFavorite: isInMyFavorite,
            rate: rate,
            distance: distance,
          ),
          SizedBox(height: 60),
          ResturantFood(),
        ],
      ),
    );
  }
}

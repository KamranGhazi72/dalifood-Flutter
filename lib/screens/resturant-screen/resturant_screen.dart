import 'package:dali_food/screens/resturant-screen/widgets/resturant_body.dart';
import 'package:flutter/material.dart';

class ResturantScreen extends StatefulWidget {
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

  ResturantScreen({
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
  _ResturantScreenState createState() => _ResturantScreenState();
}

class _ResturantScreenState extends State<ResturantScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResturantBody(
        name: widget.name,
        type: widget.type,
        latitude: widget.latitude,
        longitude: widget.longitude,
        city: widget.city,
        address: widget.address,
        sendingPrice: widget.sendingPrice,
        description: widget.description,
        isInMyFavorite: widget.isInMyFavorite,
        rate: widget.rate,
        distance: widget.distance,
        imageAddress: widget.imageAddress,
      ),
    );
  }
}

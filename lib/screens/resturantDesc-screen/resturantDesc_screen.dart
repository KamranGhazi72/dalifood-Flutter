import 'package:dali_food/screens/resturantDesc-screen/widget/rDesc_body.dart';
import 'package:flutter/material.dart';

class ResturantDescScreen extends StatefulWidget {
  String name;
  String type;
  String latitude;
  String longitude;
  String? city;
  String address;
  String? description;

  ResturantDescScreen({
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
  _ResturantDescScreenState createState() => _ResturantDescScreenState();
}

class _ResturantDescScreenState extends State<ResturantDescScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF535353),
        centerTitle: true,
        title: Column(
          children: [
            Text('جزییات رستوران',
                style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
            // Text('${demoCarts.length} آیتم',
            //     style: TextStyle(
            //         fontSize: 13,
            //         fontWeight: FontWeight.bold,
            //         color: Colors.black38)),
          ],
        ),
      ),
      body: RDescBody(
        name: widget.name,
        type: widget.type,
        latitude: widget.latitude,
        longitude: widget.longitude,
        city: widget.city,
        address: widget.address,
        description: widget.description,
      ),
    );
  }
}

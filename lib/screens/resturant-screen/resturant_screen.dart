import 'package:dali_food/screens/resturant-screen/widgets/resturant_body.dart';
import 'package:flutter/material.dart';

class ResturantScreen extends StatefulWidget {
  const ResturantScreen({ Key? key }) : super(key: key);

  @override
  _ResturantScreenState createState() => _ResturantScreenState();
}

class _ResturantScreenState extends State<ResturantScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResturantBody(),
    );
  }
}
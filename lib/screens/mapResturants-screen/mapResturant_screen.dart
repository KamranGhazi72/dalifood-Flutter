import 'package:dali_food/screens/mapResturants-screen/widgets/mapResturant_body.dart';
import 'package:flutter/material.dart';

class MapResturantScreen extends StatefulWidget {
  const MapResturantScreen({Key? key}) : super(key: key);

  @override
  _MapResturantScreenState createState() => _MapResturantScreenState();
}

class _MapResturantScreenState extends State<MapResturantScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('نقشه'),
      ),
      body: MapResturantBody(),
    );
  }
}

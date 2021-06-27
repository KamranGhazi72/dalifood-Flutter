import 'package:dali_food/screens/mapResturants-screen/widgets/map_res.dart';
import 'package:flutter/material.dart';

class MapResturantBody extends StatelessWidget {
  const MapResturantBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MapRes(),
    );
  }
}

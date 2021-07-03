import 'package:flutter/material.dart';

class FDescName extends StatelessWidget {
  String resturantName;
  FDescName({
    Key? key,
    required this.resturantName,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [Text('$resturantName')],
      ),
    );
  }
}

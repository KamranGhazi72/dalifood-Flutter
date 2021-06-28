import 'package:dali_food/screens/offerList-screen/offerList_Screen.dart';
import 'package:flutter/material.dart';

class OffList extends StatelessWidget {
  const OffList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 57,
      margin: EdgeInsets.symmetric(horizontal: 10),
      padding: EdgeInsets.symmetric(vertical: 10),
      child: ElevatedButton(
        child: Text(
          'تخفیفان',
          style: TextStyle(fontSize: 18),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OfferListScreen(),
            ),
          );
        },
      ),
    );
  }
}

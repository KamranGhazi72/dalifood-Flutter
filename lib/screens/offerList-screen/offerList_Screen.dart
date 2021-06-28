import 'package:dali_food/screens/offerList-screen/widget/offerList_body.dart';
import 'package:flutter/material.dart';

class OfferListScreen extends StatefulWidget {
  const OfferListScreen({Key? key}) : super(key: key);

  @override
  _OfferListScreenState createState() => _OfferListScreenState();
}

class _OfferListScreenState extends State<OfferListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF535353),
        centerTitle: true,
        title: Column(
          children: [
            Text('لیست تخفیفات',
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
      body: OfferListBody(),
    );
  }
}

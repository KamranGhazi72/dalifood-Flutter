import 'package:dali_food/screens/resturantDesc-screen/widget/rDesc_body.dart';
import 'package:flutter/material.dart';

class ResturantDescScreen extends StatefulWidget {
  const ResturantDescScreen({Key? key}) : super(key: key);

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
      body: RDescBody(),
    );
  }
}

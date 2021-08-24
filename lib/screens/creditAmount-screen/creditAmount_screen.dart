import 'package:dali_food/screens/creditAmount-screen/widgets/creditAmount_body.dart';
import 'package:flutter/material.dart';

class CreditAmountScreen extends StatefulWidget {
  const CreditAmountScreen({ Key? key }) : super(key: key);

  @override
  _CreditAmountScreenState createState() => _CreditAmountScreenState();
}

class _CreditAmountScreenState extends State<CreditAmountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF535353),
        centerTitle: true,
        title: Text(
          'جزییات کیف پول',
          style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: CreditAmountBody(),
    );
  }
}
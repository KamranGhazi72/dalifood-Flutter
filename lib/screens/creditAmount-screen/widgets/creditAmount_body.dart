import 'package:dali_food/screens/creditAmount-screen/widgets/credit_header.dart';
import 'package:dali_food/screens/creditAmount-screen/widgets/credit_increase.dart';
import 'package:dali_food/screens/creditAmount-screen/widgets/credit_value.dart';
import 'package:flutter/material.dart';

class CreditAmountBody extends StatelessWidget {
  const CreditAmountBody({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            SizedBox(height: 40),
            CreditHeader(),
            SizedBox(height: 20),
            CreditValue(),
            SizedBox(height: 60),
            CreditIncrease(),
          ],
        ),
      ),
    );
  }
}
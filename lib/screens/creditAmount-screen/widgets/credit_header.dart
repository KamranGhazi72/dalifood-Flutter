import 'package:flutter/material.dart';

class CreditHeader extends StatelessWidget {
  const CreditHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 250,
        height: 250,
        padding: EdgeInsets.all(40),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(200),
          border: Border.all(
            width: 20,
            color: Color(0xFFAAAAAA),
          ),
        ),
        child: Image(
          image: AssetImage('assets/images/wallet.png'),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

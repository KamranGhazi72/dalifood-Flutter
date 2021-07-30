import 'package:dali_food/screens/auth-screen/setPersonal-screen/components/setPersonal_body.dart';
import 'package:flutter/material.dart';

class SetPersonalScreen extends StatelessWidget {
  final String phone;
  final String tokenHash;

  const SetPersonalScreen({Key? key, required this.phone, required this.tokenHash}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SetPersonalBody(phone: phone, tokenHash: tokenHash,),
    );
  }
}

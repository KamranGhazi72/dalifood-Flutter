import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CreditValue extends StatefulWidget {
  const CreditValue({Key? key}) : super(key: key);

  @override
  _CreditValueState createState() => _CreditValueState();
}

class _CreditValueState extends State<CreditValue> {
  bool isLoading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getCreditValue();
  }

  var amount;

  Future<int> getCreditValue() async {
    setState(() {
      isLoading = true;
    });
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString('tokenHash');

    final response = await http.get(
        Uri.parse('https://api.dalifood.app/api/User/CreditAmount'),
        headers: {
          "Content-Type": "application/json",
          'Authorization': 'Bearer $token',
        });

    if (response.statusCode == 200) {
      var responseBody = json.decode(response.body);

      setState(() {
        isLoading = false;
      });
      return amount = responseBody['amount'];
    } else {
      setState(() {
        isLoading = false;
      });
      throw Exception('Failed to load Credit Value');
    }
  }

  @override
  Widget build(BuildContext context) {
    print('responseBody Value:::::::::::    $amount');
    return Container(
      child: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Text(
              'موجودی حساب $amount تومان',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
    );
  }
}

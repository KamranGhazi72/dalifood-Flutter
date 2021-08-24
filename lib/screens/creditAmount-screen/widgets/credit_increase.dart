import 'package:dali_food/screens/profile-screen/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CreditIncrease extends StatefulWidget {
  const CreditIncrease({Key? key}) : super(key: key);

  @override
  _CreditIncreaseState createState() => _CreditIncreaseState();
}

class _CreditIncreaseState extends State<CreditIncrease> {
  bool isLoading = true;

  Future postCreditIncrease({required String increase}) async {
    setState(() {
      isLoading = true;
    });
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString('tokenHash');

    final response = await http.post(
      Uri.parse('https://api.dalifood.app/api/User/IncreaseCredit'),
      headers: {
        "Content-Type": "application/json",
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(<String, String>{
        'Amount': increase,
      }),
    );

    if (response.statusCode == 200) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('موجودی حساب شما افزایش یافت'),
        ),
      );
    } else {
      setState(() {
        isLoading = false;
      });
      throw Exception('Failed to Increase Credit');
    }
  }

  @override
  Widget build(BuildContext context) {
    var amountIncrease;

    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('افزایش موجودی:'),
              Container(
                width: MediaQuery.of(context).size.width / 1.8,
                child: TextField(
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'افزودن',
                    hintText: 'به تومان',
                    hintStyle: TextStyle(fontSize: 13.0, color: Colors.black26),
                  ),
                  onChanged: (value) {
                    amountIncrease = value;
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Container(
            width: MediaQuery.of(context).size.width / 1.1,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                print('amountIncrease:::       $amountIncrease');
                postCreditIncrease(increase: amountIncrease);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileScreen(),
                  ),
                );
              },
              child: Text('ثبت افزایش موجودی'),
            ),
          ),
        ],
      ),
    );
  }
}

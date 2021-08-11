import 'package:dali_food/screens/auth-screen/setPersonal-screen/setPersonal_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pinput/pin_put/pin_put.dart';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class VerificationCodeScreen extends StatefulWidget {
  final String phone;
  final String smsVerify;
  VerificationCodeScreen(
      {Key? key, required this.phone, required this.smsVerify})
      : super(key: key);

  @override
  _VerificationCodeScreenState createState() => _VerificationCodeScreenState();
}

class _VerificationCodeScreenState extends State<VerificationCodeScreen> {
  bool _loading = false;
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      border: Border.all(color: Colors.deepPurpleAccent),
      borderRadius: BorderRadius.circular(15.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    var page = MediaQuery.of(context).size;

    print('Phone: ${widget.phone}  &&&  Sms: ${widget.smsVerify}');

    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.ltr,
        child: Builder(
          builder: (context) {
            return Container(
              decoration: new BoxDecoration(
                gradient: new LinearGradient(
                  colors: <Color>[
                    const Color(0xff2c5364),
                    const Color(0xff0f2027)
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  new Opacity(
                    opacity: .1,
                    child: new Container(
                      width: page.width,
                      height: page.height,
                      decoration: new BoxDecoration(
                        image: new DecorationImage(
                            image: new AssetImage("assets/images/fsicon.png"),
                            repeat: ImageRepeat.repeat),
                      ),
                    ),
                  ),
                  _loading
                      ? Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'اعتبار سنجی',
                              style: TextStyle(
                                color: Color(0xFFe91e63),
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                            SizedBox(height: 10),
                            SizedBox(
                              width: page.width / 1.4,
                              child: Text(
                                "لطفا کد پیامک شده به شماره تماس خود را اینجا وارد کنید",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            SizedBox(height: 50),
                            Text(
                              'for Test: ${widget.smsVerify}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 40),
                            Container(
                              margin: const EdgeInsets.all(20.0),
                              padding: const EdgeInsets.all(20.0),
                              child: PinPut(
                                eachFieldHeight: 20,
                                eachFieldWidth: 20,
                                keyboardType: TextInputType.text,
                                fieldsCount: 6,
                                onSubmit: (value) {
                                  if (value == widget.smsVerify) {
                                    setState(() {
                                      _loading = true;
                                    });
                                    getTokenHash(
                                        widget.phone, widget.smsVerify);
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: Text(
                                                "کد وارد شده اشتباه است")));
                                  }
                                },
                                focusNode: _pinPutFocusNode,
                                controller: _pinPutController,
                                submittedFieldDecoration:
                                    _pinPutDecoration.copyWith(
                                  borderRadius: BorderRadius.circular(20.0),
                                  border: Border.all(
                                    color: Colors.white.withOpacity(.5),
                                    width: 4,
                                  ),
                                  color: Colors.white.withOpacity(.9),
                                ),
                                selectedFieldDecoration: _pinPutDecoration,
                                followingFieldDecoration:
                                    _pinPutDecoration.copyWith(
                                  borderRadius: BorderRadius.circular(5.0),
                                  border: Border.all(
                                    color: Colors.white.withOpacity(.5),
                                    width: 4,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 10.0),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            //   children: <Widget>[
                            //     TextButton(
                            //       onPressed: () => _pinPutController.text = '',
                            //       child: const Text('Clear All'),
                            //     ),
                            //   ],
                            // ),
                          ],
                        ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  getTokenHash(phone, smsVerify) async {
    try {
      final response = await http.post(
        Uri.parse(
            'https://api.dalifood.app/api/Register/VerifyPhoneNumber?phonenumber=$phone&token=$smsVerify'),
      );
      print('status: $response');
      if (response.statusCode == 200) {
        //
        print('response.body In Verifi:: ${response.body}');
        var responseBody = json.decode(response.body);

        SharedPreferences pref = await SharedPreferences.getInstance();
        await pref.setString('phone', phone);
        await pref.setString('tokenHash', responseBody['tokenHash']);

        _loading = false;
        // await _loginButtonController.forward();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => SetPersonalScreen(
                phone: phone, tokenHash: responseBody['tokenHash']),
          ),
        );
      } else {
        _loading = false;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Color(0xFFe91e63),
            content: Text(
              'کد وارد شده اشتباه است',
              textAlign: TextAlign.center,
              style: new TextStyle(color: Colors.white),
            ),
          ),
        );
        print('Naraft!!!!!!!!!!!!!!');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Color(0xFFe91e63),
          content: Text(
            '$e',
            textAlign: TextAlign.center,
            style: new TextStyle(color: Colors.white),
          ),
        ),
      );
    }
  }
}

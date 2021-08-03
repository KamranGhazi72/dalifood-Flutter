import 'dart:convert';

import 'package:dali_food/animations/singin_animation.dart';
import 'package:dali_food/screens/auth-screen/setPhone-screen/setPhone_screen.dart';
import 'package:dali_food/screens/auth-screen/sign_in/components/Form.dart';
import 'package:dali_food/screens/home-screen/home_screen.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInBody extends StatefulWidget {
  @override
  _SignInBodyState createState() => _SignInBodyState();
}

class _SignInBodyState extends State<SignInBody>
    with SingleTickerProviderStateMixin {
  bool _loading = false;
  // late AnimationController _loginButtonController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   _loginButtonController = new AnimationController(
  //       vsync: this, duration: new Duration(milliseconds: 1000));
  // }

  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   _loginButtonController.dispose();
  //   super.dispose();
  // }

  String? _phoneValue;
  String? _passwordValue;

  phoneOnSaved(String? value) {
    _phoneValue = value;
  }

  passwordOnSaved(String? value) {
    _passwordValue = value;
  }

  @override
  Widget build(BuildContext context) {
    var page = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Container(
        key: _scaffoldKey,
        decoration: new BoxDecoration(
            gradient: new LinearGradient(colors: <Color>[
          const Color(0xff2c5364),
          const Color(0xff0f2027)
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: new Stack(
          alignment: Alignment.center,
          children: <Widget>[
            new Opacity(
              opacity: .1,
              child: new Container(
                width: page.width,
                height: page.height,
                decoration: new BoxDecoration(
                    image: new DecorationImage(
                        image: new AssetImage("assets/images/fsicon.png"),
                        repeat: ImageRepeat.repeat)),
              ),
            ),
            new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'دالی فود',
                  style: TextStyle(
                    color: Color(0xFFe91e63),
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  width: page.width / 1.4,
                  child: Text(
                    "برای ثبت نام یا ورود شماره موبایل خود را وارد نمایید. یک کد 4 رقمی به شماره شما ارسال خواهد شد.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: page.width / 8),
                FormContainer(
                  formKey: _formKey,
                  phoneOnSaved: phoneOnSaved,
                  passwordOnSaved: passwordOnSaved,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SetPhoneScreen(),
                      ),
                    );
                  },
                  child: new Text(
                    "فراموشی رمزعبور؟",
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        letterSpacing: 0.5,
                        color: Colors.lightBlueAccent,
                        fontSize: 14),
                  ),
                ),
                SizedBox(height: 70),
                // GestureDetector(
                //     onTap: () {
                //       if (_formKey.currentState!.validate()) {
                //         print(_formKey.currentState!.validate());
                //         _formKey.currentState!.save();
                //         print('http request');
                //         print(_phoneValue);
                //         print(_passwordValue);
                //         sendDataForLogin(_phoneValue, _passwordValue);
                //       }
                //     },
                //     child: SingInAnimation(
                //       controller: _loginButtonController.view,
                //     )),
                SizedBox(
                  width: page.width / 1.3,
                  height: 65,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff075E54),
                      padding: EdgeInsets.symmetric(vertical: 15),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          _loading = true;
                        });
                        print(_formKey.currentState!.validate());
                        _formKey.currentState!.save();
                        print('http request');
                        print(_phoneValue);
                        print(_passwordValue);
                        sendDataForLogin(_phoneValue, _passwordValue);
                      }
                    },
                    child: _loading
                        ? CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : Text('ارسال کد اعتبارسنجی'),
                  ),
                ),
                SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SetPhoneScreen(),
                      ),
                    );
                  },
                  child: new Text(
                    "آیا هیچ اکانتی ندارید؟ عضویت",
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        letterSpacing: 0.5,
                        color: Colors.white,
                        fontSize: 13),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  sendDataForLogin(_phoneValue, _passwordValue) async {
    // await _loginButtonController.animateTo(0.150);
    try {
      final response = await http.post(
        Uri.parse(
            'https://api.dalifood.app/api/Login?Phonenumber=$_phoneValue&password=$_passwordValue'),
      );
      print('status: $response');
      if (response.statusCode == 200) {
        //
        print('response.body:: ${response.body}');
        var responseBody = json.decode(response.body);

        print('responseBody:: $responseBody');

        SharedPreferences pref = await SharedPreferences.getInstance();
        await pref.setString('tokenHash', responseBody['token']);

        _loading = false;
        // await _loginButtonController.forward();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ),
        );
      } else {
        _loading = false;
        // await _loginButtonController.reverse();
        var responseError = json.decode(response.body);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Color(0xFFe91e63),
            content: Text(
              '${responseError['title']}',
              textAlign: TextAlign.center,
              style: new TextStyle(color: Colors.white),
            ),
          ),
        );
      }
    } catch (e) {
      _loading = false;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Color(0xFFe91e63),
          content: Text(
            'Catch',
            textAlign: TextAlign.center,
            style: new TextStyle(color: Colors.white),
          ),
        ),
      );
    }
  }
}

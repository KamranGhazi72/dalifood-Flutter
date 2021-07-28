import 'package:dali_food/screens/auth-screen/sign_in/components/Form.dart';
import 'package:dali_food/screens/auth-screen/verificationCode-screen/verificationCode_screen.dart';
import 'package:dali_food/services/services.dart';
import 'package:flutter/material.dart';

class SignInBody extends StatefulWidget {
  @override
  _SignInBodyState createState() => _SignInBodyState();
}

class _SignInBodyState extends State<SignInBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String? _phoneValue;
  String? _passwordValue;

  phoneOnSaved(String? value) {
    _phoneValue = value;
  }

  passwordOnSaved(String value) {
    _passwordValue = value;
  }

  @override
  Widget build(BuildContext context) {
    var page = MediaQuery.of(context).size;

    return Container(
      key: _scaffoldKey,
      decoration: new BoxDecoration(
          gradient: new LinearGradient(
              colors: <Color>[const Color(0xff2c5364), const Color(0xff0f2027)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
      child: new Stack(
        alignment: Alignment.bottomCenter,
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
              ),
              SizedBox(height: 70),
              SizedBox(
                width: page.width / 1.3,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff075E54),
                    padding: EdgeInsets.symmetric(vertical: 15),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      print(_formKey.currentState!.validate());
                      _formKey.currentState!.save();
                      print('http request');
                      print(_phoneValue);
                      print(_passwordValue);
                      sendDataForLogin();
                    }
                  },
                  child: Text('ارسال کد اعتبارسنجی'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  sendDataForLogin() async {
    // await _loginButtonController.animateTo(0.150);
    Map response =
        await (new Services()).sendDataToLogin({"phonenumber": _phoneValue});
    print('status: $response');
    if (response['status'] == 'success') {
      //
      // await _loginButtonController.forward();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => VerificationCodeScreen(),
        ),
      );
    } else {
      // await _loginButtonController.reverse();
      // _scaffoldKey.currentState!.showSnackBar(new SnackBar(
      //     content: new Text(
      //   response['data'],
      //   style: new TextStyle(fontFamily: 'Vazir'),
      // )));
      print('Naraft!!!!!!!!!!!!!!');
    }
  }
}

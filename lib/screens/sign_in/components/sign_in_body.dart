import 'package:dali_food/screens/sign_in/components/Form.dart';
import 'package:dali_food/screens/verificationCode-screen/verificationCode_screen.dart';
import 'package:flutter/material.dart';

class SignInBody extends StatefulWidget {
  @override
  _SignInBodyState createState() => _SignInBodyState();
}

class _SignInBodyState extends State<SignInBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _phoneValue;

  phoneOnSaved(String? value) {
    _phoneValue = value;
  }

  @override
  Widget build(BuildContext context) {
    var page = MediaQuery.of(context).size;

    return Container(
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
              SizedBox(height: page.width / 5),
              FormContainer(
                formKey: _formKey,
                phoneOnSaved: phoneOnSaved,
              ),
              SizedBox(height: 60),
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VerificationCodeScreen(),
                        ),
                      );
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
}

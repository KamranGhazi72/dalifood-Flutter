import 'package:dali_food/screens/auth-screen/setPhone-screen/components/Form.dart';
import 'package:dali_food/screens/auth-screen/verificationCode-screen/verificationCode_screen.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class SetPhoneBody extends StatefulWidget {
  @override
  _SetPhoneBodyState createState() => _SetPhoneBodyState();
}

class _SetPhoneBodyState extends State<SetPhoneBody> {
  bool _loading = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String? _phoneValue;

  phoneOnSaved(String? value) {
    _phoneValue = value;
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
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal,
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
                      sendDataForLogin(_phoneValue);
                    }
                  },
                  child: _loading
                      ? CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : Text('ارسال کد اعتبارسنجی'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  sendDataForLogin(_phoneValue) async {
    // await _loginButtonController.animateTo(0.150);
    try {
      final response = await http.post(
        Uri.parse(
            'https://api.dalifood.app/api/Register/SetPhoneNumber?phonenumber=$_phoneValue'),
      );
      print('status: $response');
      if (response.statusCode == 200) {
        //
        print('response.body:: ${response.body}');

        _loading = false;
        // await _loginButtonController.forward();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VerificationCodeScreen(
                phone: _phoneValue, smsVerify: response.body),
          ),
        );
      } else {
        _loading = false;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Color(0xFFe91e63),
            content: Text(
              'ارتباط شما با سرور قطع می باشد',
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

import 'dart:convert';
import 'package:dali_food/screens/auth-screen/setPersonal-screen/components/Form.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class SetPersonalBody extends StatefulWidget {
  final String phone;
  final String tokenHash;

  SetPersonalBody({Key? key, required this.phone, required this.tokenHash}) : super(key: key);
  @override
  _SetPersonalBodyState createState() => _SetPersonalBodyState();
}

class _SetPersonalBodyState extends State<SetPersonalBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String? _nameValue;
  String? _familyValue;
  String? _passwordValue;
  String? _confirmPasswordValue;

  nameOnSaved(String? value) {
    _nameValue = value;
  }

  familyOnSaved(String? value) {
    _familyValue = value;
  }

  passwordOnSaved(String? value) {
    _passwordValue = value;
  }

  confirmPasswordOnSaved(String? value) {
    _confirmPasswordValue = value;
  }

  @override
  Widget build(BuildContext context) {
    var page = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Container(
        key: _scaffoldKey,
        decoration: new BoxDecoration(
            gradient: new LinearGradient(
                colors: <Color>[const Color(0xff2c5364), const Color(0xff0f2027)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
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
                  nameOnSaved: nameOnSaved,
                  familyOnSaved: familyOnSaved,
                  passwordOnSaved: passwordOnSaved,
                  confirmPasswordOnSaved: confirmPasswordOnSaved,
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
                        sendDataForLogin(widget.phone , widget.tokenHash);
                      }
                    },
                    child: Text('ارسال کد اعتبارسنجی'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  sendDataForLogin(phone , tokenHash) async {
    Map data = {
      "password": _passwordValue,
      "confrimPassword": _confirmPasswordValue,
      "name": _nameValue,
      "family": _familyValue,
    };
    var body = json.encode(data);
    // await _loginButtonController.animateTo(0.150);
    final response =
        await http.post(
      Uri.parse(
          'https://api.dalifood.app/api/Register?phonenumber=$phone&token=$tokenHash'),
      headers: {
        "Content-Type": "application/json",
        // "Accept": "application/json",
      },
      body: body,
    );
    print('status: ${response.body}');
    if (response.statusCode == 200) {
      //
      print('response.body SetPersonal:: ${response.body}');
      // await _loginButtonController.forward();
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => VerificationCodeScreen(),
      //   ),
      // );
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

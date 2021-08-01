import 'dart:async';
import 'package:connectivity/connectivity.dart';
import 'package:dali_food/screens/auth-screen/sign_in/sign_in_screen.dart';
import 'package:dali_food/screens/home-screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  navigationToLogin() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => SignInScreen(),
      ),
    );
  }

  navigationToHome() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => HomeScreen(),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkLogin();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        key: _scaffoldKey,
        backgroundColor: new Color(0xff075E54),
        body: new Stack(
          fit: StackFit.expand,
          children: <Widget>[
            new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Container(
                  width: 125,
                  height: 125,
                  decoration: new BoxDecoration(
                      image: new DecorationImage(
                          image: new AssetImage("assets/images/logo.png"))),
                ),
                new Text("دالی فود",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold))
              ],
            ),
            new Padding(
              padding: const EdgeInsets.only(bottom: 100),
              child: new Align(
                alignment: Alignment.bottomCenter,
                child: new CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
            )
          ],
        ));
  }

  checkLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? apiToken = prefs.getString('tokenHash');

//    if(apiToken == null) navigationToLogin();

    if (await checkConnectionInternet()) {
      // check api Token
      if (apiToken == null) {
        navigationToLogin();
      } else {
        navigationToHome();
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
          duration: new Duration(hours: 2),
          content: new GestureDetector(
            onTap: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              checkLogin();
            },
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Text(
                  'از اتصال دستگاه به اینترنت مطمئن شوید',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                new Icon(Icons.wifi_lock, color: Colors.white)
              ],
            ),
          )));
    }
  }

  Future<bool> checkConnectionInternet() async {
    var connectivityResult = await (new Connectivity().checkConnectivity());
    return connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi;
  }
}

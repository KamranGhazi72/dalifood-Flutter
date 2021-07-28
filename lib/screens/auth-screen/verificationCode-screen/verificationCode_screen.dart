import 'package:dali_food/screens/home-screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pin_put/pin_put.dart';

class VerificationCodeScreen extends StatefulWidget {
  const VerificationCodeScreen({Key? key}) : super(key: key);

  @override
  _VerificationCodeScreenState createState() => _VerificationCodeScreenState();
}

class _VerificationCodeScreenState extends State<VerificationCodeScreen> {
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
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.all(20.0),
                        padding: const EdgeInsets.all(20.0),
                        child: PinPut(
                          eachFieldHeight: 60,
                          eachFieldWidth: 60,
                          keyboardType: TextInputType.number,
                          fieldsCount: 4,
                          onSubmit: (value) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomeScreen(),
                              ),
                            );
                          },
                          focusNode: _pinPutFocusNode,
                          controller: _pinPutController,
                          submittedFieldDecoration: _pinPutDecoration.copyWith(
                            borderRadius: BorderRadius.circular(20.0),
                            border: Border.all(
                              color: Colors.white.withOpacity(.5),
                              width: 4,
                            ),
                            color: Colors.white.withOpacity(.9),
                          ),
                          selectedFieldDecoration: _pinPutDecoration,
                          followingFieldDecoration: _pinPutDecoration.copyWith(
                            borderRadius: BorderRadius.circular(5.0),
                            border: Border.all(
                              color: Colors.white.withOpacity(.5),
                              width: 4,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          FlatButton(
                            onPressed: () => _pinPutController.text = '',
                            child: const Text('Clear All'),
                          ),
                        ],
                      ),
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

  // void _showSnackBar(String pin, BuildContext context) {
  //   final snackBar = SnackBar(
  //     duration: const Duration(seconds: 3),
  //     content: Container(
  //       height: 80.0,
  //       child: Center(
  //         child: Text(
  //           'Pin Submitted. Value: $pin',
  //           style: const TextStyle(fontSize: 25.0),
  //         ),
  //       ),
  //     ),
  //     backgroundColor: Colors.deepPurpleAccent,
  //   );
  //   Scaffold.of(context)
  //     ..hideCurrentSnackBar()
  //     ..showSnackBar(snackBar);
  // }
}

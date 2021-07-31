import 'dart:convert';
import 'package:dali_food/screens/address-screen/address_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class MapRes extends StatefulWidget {
  const MapRes({Key? key}) : super(key: key);

  @override
  _MapResState createState() => _MapResState();
}

class _MapResState extends State<MapRes> {
  String? _txtAddress;
  static LatLng myLocation = new LatLng(33.51189550112129, 48.35531868707115);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _plaakValue;
  String? _vahedValue;

  plaakOnSaved(String? value) {
    _plaakValue = value;
  }

  vahedOnSaved(String? value) {
    _vahedValue = value;
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      new LatLng(33.51189550112129, 48.35531868707115);
    });
    getMapirApi(myLocation.latitude, myLocation.longitude);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF535353),
        centerTitle: true,
        title: Text(
          'انتخاب آدرس',
          style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              center: myLocation,
              zoom: 16.0,
              onTap: _handleTap,
            ),
            layers: [
              TileLayerOptions(
                urlTemplate:
                    'https://api.mapbox.com/styles/v1/kamran1372/ckqdqgwww2wz717u3eeenrbpf/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1Ijoia2FtcmFuMTM3MiIsImEiOiJja2w3dGkwMWwwOTRzMnJydncxMWVxYXBtIn0.RUMAja78Qzyd2PZScsK3Gw',
                additionalOptions: {
                  'accessToken':
                      'pk.eyJ1Ijoia2FtcmFuMTM3MiIsImEiOiJja2w3dGkwMWwwOTRzMnJydncxMWVxYXBtIn0.RUMAja78Qzyd2PZScsK3Gw',
                  'id': 'mapbox.streets',
                },
              ),
              MarkerLayerOptions(
                markers: [
                  Marker(
                    width: 20.0,
                    height: 20.0,
                    point: myLocation,
                    builder: (ctx) => Container(
                      child: Icon(
                        Icons.fastfood_rounded,
                        color: Color(0xFFe91e63),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            bottom: 10,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              margin: EdgeInsets.symmetric(horizontal: 5),
              width: MediaQuery.of(context).size.width / 1.025,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFEEEEEE),
                    blurRadius: 3,
                    spreadRadius: 3,
                  ),
                ],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.1,
                      height: 40,
                      child: Text(
                        'جزییات آدرس خود را وارد کنید:',
                        textAlign: TextAlign.right,
                      ),
                    ),
                    // SizedBox(
                    //   width: MediaQuery.of(context).size.width / 1.07,
                    //   child: TextFormField(
                    //     initialValue: _txtAddress,
                    //     decoration: InputDecoration(
                    //       labelText: "Enter Email",
                    //       fillColor: Colors.white,
                    //       focusedBorder: OutlineInputBorder(
                    //         borderRadius: BorderRadius.circular(15.0),
                    //         borderSide: BorderSide(
                    //           color: Colors.blue,
                    //         ),
                    //       ),
                    //       enabledBorder: OutlineInputBorder(
                    //         borderRadius: BorderRadius.circular(15.0),
                    //         borderSide: BorderSide(
                    //           color: Colors.grey,
                    //           width: 1.0,
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2.2,
                          child: TextFormField(
                            onSaved: plaakOnSaved,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: 'شماره پلاک ',
                              labelText: "پلاک",
                              labelStyle: TextStyle(color: Color(0xFFe91e63)),
                              fillColor: Colors.white,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: BorderSide(
                                  color: Color(0xFFe91e63),
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: BorderSide(
                                  color: Color(0xFFEEEEEE),
                                  width: 1.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2.2,
                          child: TextFormField(
                            onSaved: vahedOnSaved,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: 'شماره واحد ',
                              labelText: "واحد",
                              labelStyle: TextStyle(color: Color(0xFFe91e63)),
                              fillColor: Colors.white,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: BorderSide(
                                  color: Color(0xFFe91e63),
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: BorderSide(
                                  color: Color(0xFFEEEEEE),
                                  width: 1.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.08,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFFe91e63),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            String? _totalAddress = '$_txtAddress، ' +
                                'پلاک: $_plaakValue ' +
                                'واحد: $_vahedValue ';
                            print('_totalAddress:::    $_totalAddress');
                            newAddressPostToServer(_totalAddress,
                                myLocation.latitude, myLocation.longitude);
                          }
                        },
                        child: Text(
                          'ثبت آدرس جدید',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  _handleTap(LatLng point) {
    setState(() {
      myLocation = point;
    });
    getMapirApi(myLocation.latitude, myLocation.longitude);
    print(
        'MyLocation:::  ${myLocation.latitude}  &&&  ${myLocation.longitude}');
  }

  getMapirApi(latitude, longitude) async {
    var headers = {
      'x-api-key':
          'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6ImUwYjE1YjY0N2Y0NzBmNDdmNmRjMDVkYjdiM2UyMTk4OWJjMGU5ZGJmYzM4NWRhY2YzMGE4YWJkYzY0MmU5MjFlYmU4NzFmOTZlNjBhNGNiIn0.eyJhdWQiOiIxMTAzMSIsImp0aSI6ImUwYjE1YjY0N2Y0NzBmNDdmNmRjMDVkYjdiM2UyMTk4OWJjMGU5ZGJmYzM4NWRhY2YzMGE4YWJkYzY0MmU5MjFlYmU4NzFmOTZlNjBhNGNiIiwiaWF0IjoxNjAxNDMwNzAwLCJuYmYiOjE2MDE0MzA3MDAsImV4cCI6MTYwMzkzNjMwMCwic3ViIjoiIiwic2NvcGVzIjpbImJhc2ljIl19.C3xQ_vLQAWV_pADocE6QdhAzi6A1UeGbUkJ7Q83j2Sclqb2uw23zI4RNqpXv2H2iY1L-n1uOimwNSOAvSPTGrJ0362t5Tj7e4yk_MfgeHIPF9opdZmRrV9_R27S6JdCMiz_82owcspICEL3yz-AJG-9BGrjlkMdy3gszUmtQpAzSBuIZdKuT8nUhAafwTXOfKxJgoeVhIR7-WSOk021L-EPAdgFCWdFWoZ-dB76dzlAkJsyTZVb452jnaRVr8u0VXhBizFZwF4QaPHjvBW6-frh4pw7mMKSkZxBJ1m-lZZotsEbNa7cWKdkdENfakb8YM3jwI_e-WoavuacdcdtU7g'
    };
    final response = await http.get(
      Uri.parse('https://map.ir/reverse?lat=$latitude&lon=$longitude'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);
      _txtAddress = responseData['address_compact'];
    } else {
      print('error');
    }
  }

  newAddressPostToServer(_totalAddress, latitude, longitude) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString('tokenHash');
    print('token:::   Bearer $token');

    Map data = {
      "textAddress": _totalAddress,
      "latitude": "$latitude",
      "longitude": "$longitude",
    };
    print('data::::   $data');
    var body = json.encode(data);
    print('body:::   $body');
    // await _loginButtonController.animateTo(0.150);
    final response = await http.post(
      Uri.parse('https://api.dalifood.app/api/User/AddAddress'),
      headers: {
        "Content-Type": "application/json",
        'Authorization': 'Bearer $token',
        // "Accept": "application/json",
      },
      body: body,
    );
    print('status: ${response.statusCode}');
    if (response.statusCode == 200) {
      //
      print('response.body New Address:: ${response.bodyBytes}');
      // await _loginButtonController.forward();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => AddressScreen(),
        ),
      );
    } else {
      // await _loginButtonController.reverse();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('snack'),
        duration: const Duration(seconds: 1),
        action: SnackBarAction(
          label: 'ACTION',
          onPressed: () {},
        ),
      ));

      print('Naraft!!!!!!!!!!!!!!');
    }
  }
}

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CustomerAddress {
  int id;
  String lat;
  String long;
  String textAddress;

  CustomerAddress({
    required this.id,
    required this.lat,
    required this.long,
    required this.textAddress,
  });

  factory CustomerAddress.fromJson(Map<String, dynamic> json) {
    return CustomerAddress(
      id: json['id'],
      lat: json['latitude'],
      long: json['longitude'],
      textAddress: json['textAddress'],
    );
  }
}

List<CustomerAddress> addr = [
  // CustomerAddress(
  //   id: 0,
  //   addressText:
  //       'مهران - پیامبر - بلوار آیت الله کاشانی - روبرو پاساژ یاران - جنب فست فود آلاوین - ساختمان پاسارگاد - پلاک 55 - طبقه 5 - واحد 9',
  // ),
  // CustomerAddress(
  //   id: 1,
  //   addressText:
  //       'مهران - پیامبر - بلوار آیت الله کاشانی - روبرو پاساژ یاران - جنب فست فود آلاوین - ساختمان پاسارگاد - پلاک 55 - طبقه 5 - واحد 9',
  // ),
];

Future<CustomerAddress> getAllAddresses() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  var token = pref.getString('tokenHash');
  print('token:::   Bearer $token');

  final response = await http.get(
      Uri.parse(
          'https://api.dalifood.app/api/User/MyAddress?ItemPerPage=10&PageNum=1'),
      headers: {
        "Content-Type": "application/json",
        'Authorization': 'Bearer $token',
      });
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    print('response.body:::     ${response.body}');
    return CustomerAddress.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

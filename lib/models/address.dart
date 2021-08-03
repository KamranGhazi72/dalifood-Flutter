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

  factory CustomerAddress.fromJson(Map<String, dynamic> parsedJson) {
    return CustomerAddress(
      id: parsedJson['id'],
      lat: parsedJson['latitude'],
      long: parsedJson['longitude'],
      textAddress: parsedJson['textAddress'],
    );
  }
}

Future<Map> getAllAddresses(int page) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  var token = pref.getString('tokenHash');
  // print('token:::   Bearer $token');
  print('page:  $page');
  final response = await http.get(
      Uri.parse(
          'https://api.dalifood.app/api/User/MyAddress?ItemPerPage=7&PageNum=$page'),
      headers: {
        "Content-Type": "application/json",
        'Authorization': 'Bearer $token',
      });
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    print('response.body:::     ${response.body}');
    var responseBody = json.decode(response.body);

    List<CustomerAddress> addr = [];
    responseBody['\u0024values'].forEach((item) {
      addr.add(CustomerAddress.fromJson(item));
    });

    return {'address': addr};
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

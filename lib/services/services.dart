import 'dart:convert';
import 'package:http/http.dart' as http;

class Services {
  Future<Map> sendDataToLogin(Map body) async {
    print(' $body');
    final response = await http.post(
      Uri.parse(
          'https://api.dalifood.app/api/Register/SetPhoneNumber?phonenumber=$body'),
    );

    print('response:: ${response.body}');

    var responseBody = json.decode(response.body);
    return responseBody;
  }
}

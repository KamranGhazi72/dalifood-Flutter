import 'dart:convert';
import 'package:dali_food/models/product.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Services {
  
  var searchProducts = <Product>[];


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

  Future<Map> fetchProductsThatSearched() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString('tokenHash');

    final response = await http.get(
      Uri.parse('https://api.dalifood.app/Api/CustomerProduct/CustomerProducts/Search?ItemPerPage=5&PageNum=1&q=%D8%B3%D9%88%D8%B4%DB%8C%20%D8%A7%DA%A9%D8%A8%D8%B1%20%D8%AC%D9%88%D8%AC%D9%87'),
      headers: {
        "Content-Type": "application/json",
        'Authorization': 'Bearer $token',
      }
    );

    if (response.statusCode == 200) {
      print('response.body:::     ${response.body}');
      var responseBody = json.decode(response.body);

      responseBody['\u0024values'].forEach((item) {
        searchProducts.add(Product.fromJson(item));
      });
      // isLoading(false);
      return {'productsSearchedItem': searchProducts};
    } else {
      // isLoading(false);
      throw Exception('Failed to load address');
    }
  }
}

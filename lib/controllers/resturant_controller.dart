import 'package:dali_food/models/resturants.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ResturantsController extends GetxController {
  var isLoading = true.obs;

  var resturants = <Resturant>[].obs;

  void onInit() {
    super.onInit();
    // fetchResturants();
  }


  Future<Map> fetchResturants({required int customerId}) async {
    isLoading(true);
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString('tokenHash');

    final response = await http.get(
        Uri.parse(
            'https://api.dalifood.app/api/Customer?ItemPerPage=10&PageNum=1&CustomerId=7'),
        headers: {
          "Content-Type": "application/json",
          'Authorization': 'Bearer $token',
        });

    if (response.statusCode == 200) {
      print('response.body Resturant:::     ${response.body}');
      var responseBody = json.decode(response.body);

      responseBody['\u0024values'].forEach((item) {
        resturants.add(Resturant.fromJson(item));
      });
      isLoading(false);
      return {'resturantsItem': resturants};
    } else {
      isLoading(false);
      throw Exception('Failed to load address');
    }
  }

  

  
  //   await Future.delayed(Duration(seconds: 1));
  //   var productsResult = [
  //     Product(
  //       id: 0,
  //       resturantName: 'ایتالین',
  //       foodName: 'پیتزا ماراریتا',
  //       foodDesc: 'گوشت راسته، قارچ، پنیر فلفل، ژامبون گوشت، ذرت',
  //       price: 23000,
  //       offerPrice: 18000,
  //       peykPrice: 1500,
  //       img: [
  //         'assets/images/berger3.png',
  //         'assets/images/kabab3.jpg',
  //         'assets/images/pizza1.jpg'
  //       ],
  //     ),
  //     Product(
  //       id: 1,
  //       resturantName: 'علی بابا',
  //       foodName: 'کباب ترش',
  //       foodDesc: 'گوشت راسته، قارچ، پنیر فلفل، ژامبون گوشت، ذرت',
  //       price: 23000,
  //       offerPrice: 18000,
  //       peykPrice: 1500,
  //       img: ['assets/images/kabab2.jpg'],
  //     ),
  //     Product(
  //       id: 2,
  //       resturantName: 'ایتالین',
  //       foodName: 'پیتزا مارگاریتا',
  //       foodDesc: 'گوشت راسته، قارچ، پنیر فلفل، ژامبون گوشت، ذرت',
  //       price: 23000,
  //       peykPrice: 1500,
  //       img: ['assets/images/pizza1.jpg'],
  //     ),
  //     Product(
  //       id: 3,
  //       resturantName: 'ایتالین',
  //       foodName: 'پیتزا مارگاریتا',
  //       foodDesc: 'گوشت راسته، قارچ، پنیر فلفل، ژامبون گوشت، ذرت',
  //       price: 23000,
  //       offerPrice: 18000,
  //       peykPrice: 1500,
  //       img: ['assets/images/berger1.jpg'],
  //     ),
  //     Product(
  //       id: 4,
  //       resturantName: 'ایتالین',
  //       foodName: 'پیتزا مارگاریتا',
  //       foodDesc: 'گوشت راسته، قارچ، پنیر فلفل، ژامبون گوشت، ذرت',
  //       price: 23000,
  //       peykPrice: 1500,
  //       img: ['assets/images/kabab3.jpg'],
  //     ),
  //     Product(
  //       id: 5,
  //       resturantName: 'ایتالین',
  //       foodName: 'پیتزا مارگاریتا',
  //       foodDesc: 'گوشت راسته، قارچ، پنیر فلفل، ژامبون گوشت، ذرت',
  //       price: 23000,
  //       offerPrice: 18000,
  //       peykPrice: 1500,
  //       img: ['assets/images/kabab1.jpg'],
  //     ),
  //   ];
  //   products.value = productsResult;
  // }
  
  // // var counterBuy = 0;
  // // increaseBuy() {
  // //   counterBuy++;
  // //   print('increased !!!!!!!!!!!!!!!');
  // //   print(counterBuy);
  // //   update();
  // // }
}

class ResturantsFirstlyController extends GetxController {
  var isLoading = true.obs;

  var resturants = <Resturant>[].obs;
  // var counter = 0.obs;

  // increament() {
  //   counter++;
  // }

  void onInit() {
    super.onInit();
    fetchRateResturants();
  }

  Future<Map> fetchRateResturants() async {
    isLoading(true);
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString('tokenHash');

    final response = await http.get(
        Uri.parse(
            'https://api.dalifood.app/api/Customer?ItemPerPage=10&PageNum=1'),
        headers: {
          "Content-Type": "application/json",
          'Authorization': 'Bearer $token',
        });

    if (response.statusCode == 200) {
      print('response.body Resturant:::     ${response.body}');
      var responseBody = json.decode(response.body);

      responseBody['\u0024values'].forEach((item) {
        resturants.add(Resturant.fromJson(item));
      });
      isLoading(false);
      return {'resturantsItem': resturants};
    } else {
      isLoading(false);
      throw Exception('Failed to load address');
    }
  }
}

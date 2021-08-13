import 'package:dali_food/controllers/product_controller.dart';
import 'package:dali_food/models/catMenu.dart';
import 'package:dali_food/screens/category-screen/category_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CatMenuWidget extends StatefulWidget {
  CatMenuWidget({Key? key}) : super(key: key);

  @override
  _CatMenuWidgetState createState() => _CatMenuWidgetState();
}

class _CatMenuWidgetState extends State<CatMenuWidget> {
  var isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    fetchAllCatMenu();
  }

  var catMenu = <CatMenu>[];
  Future<List<CatMenu>> fetchAllCatMenu() async {
    setState(() {
      isLoading = true;
    });
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString('tokenHash');

    final response = await http.get(
        Uri.parse(
            'https://api.dalifood.app/api/Customer/Categories?ItemPerPage=9&PageNum=1'),
        headers: {
          "Content-Type": "application/json",
          'Authorization': 'Bearer $token',
        });

    if (response.statusCode == 200) {
      print('response.body:::     ${response.body}');
      var responseBody = json.decode(response.body);

      responseBody['\u0024values'].forEach((item) {
        catMenu.add(CatMenu.fromJson(item));
      });
      setState(() {
        isLoading = false;
      });
      return catMenu;
    } else {
      setState(() {
        isLoading = false;
      });
      throw Exception('Failed to load address');
    }
  }

  final productsController = Get.put(ProductsController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 5),
      height: 45,
      child: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: catMenu.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    productsController.fetchProducts(customerId: catMenu[index].id);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            CategoryScreen(),
                      ),
                    );
                  },
                  child: Container(
                    width: 120,
                    margin: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                    // padding: EdgeInsets.symmetric(
                    //   horizontal: 20,
                    //   vertical: 35,
                    // ),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                            catMenu[index].imageAddress,
                          ),
                          fit: BoxFit.cover),
                      // color: Color(int.parse(i.img)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text.rich(
                        TextSpan(
                          text: catMenu[index].name,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}

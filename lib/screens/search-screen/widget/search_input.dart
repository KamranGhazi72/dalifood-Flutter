import 'package:dali_food/controllers/product_controller.dart';
import 'package:dali_food/models/product.dart';
import 'package:dali_food/screens/foodDesc-screen/foodDesc_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class SearchInput extends StatelessWidget {
  SearchInput({Key? key}) : super(key: key);

  final productsSearchController = Get.put(ProductsController);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25, vertical: 2),
      width: MediaQuery.of(context).size.width * 0.875,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 1, color: Color(0xFFEEEEEE)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextButton(
        onPressed: () async {
          showSearch(
            context: context,
            delegate: FoodSearch(),
          );
        },
        child: Row(
          children: [
            SizedBox(
              width: 50,
              child: Icon(Icons.search),
            ),
            Text(
              'جستوجو براساس نام غذا، رستوران',
              style: TextStyle(
                fontSize: 13,
                color: Color(0xFFBBBBBB),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FoodSearch extends SearchDelegate<String?> {
  @override
  List<Widget> buildActions(BuildContext context) => [
        IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            if (query.isEmpty) {
              close(context, null);
            } else {
              query = '';
              showSuggestions(context);
            }
          },
        )
      ];

  @override
  Widget buildLeading(BuildContext context) => IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () => close(context, null),
      );

  var searchProducts = <Product>[];

  Future<List<Product>> fetchProductsThatSearched() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString('tokenHash');

    final response = await http.get(
        Uri.parse(
            'https://api.dalifood.app/Api/CustomerProduct/CustomerProducts/Search?ItemPerPage=5&PageNum=1&q=%D8%B3%D9%88%D8%B4%DB%8C%20%D8%A7%DA%A9%D8%A8%D8%B1%20%D8%AC%D9%88%D8%AC%D9%87'),
        headers: {
          "Content-Type": "application/json",
          'Authorization': 'Bearer $token',
        });

    if (response.statusCode == 200) {
      print('response.body BuildingResult:::     ${response.body}');
      var responseBody = json.decode(response.body);

      responseBody['\u0024values'].forEach((item) {
        searchProducts.add(Product.fromJson(item));
      });
      // isLoading(false);
      return searchProducts;
    } else {
      // isLoading(false);
      throw Exception('Failed to load address');
    }
  }

  @override
  Widget buildResults(BuildContext context) => FutureBuilder(
        future: fetchProductsThatSearched(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            default:
              if (snapshot.hasError) {
                return Container(
                  color: Colors.black,
                  alignment: Alignment.center,
                  child: Text(
                    'Something went wrong!',
                    style: TextStyle(fontSize: 28, color: Colors.white),
                  ),
                );
              } else {
                return buildResultSuccess(snapshot.data);
                // return GestureDetector(
                //   onTap: () {
                //     print('snapshot.data In Result::::::::   ${snapshot.data}');
                //     Navigator.push(context, MaterialPageRoute(builder: (context) => SearchCategory(searchProducts: snapshot.data),),);
                //   },
                // );
                // return ListView.builder(
                //   itemCount: snapshot.data.length,
                //   itemBuilder: (context, index) => ListTile(
                //     title: Text(snapshot.data[index].na),
                //     onTap: () {
                //       Navigator.push(
                //           context, DetailsPage(snapshot.data[index]));
                //     },
                //   ),
                // );
              }
          }
        },
      );

  Future<List<String>> fetchProductsNameThatSearched(
      {required String subject}) async {
    String? _queryResult;
    print('query::::::    $subject');
    if (subject != '') {
      _queryResult = '&q=$subject';
    } else {
      _queryResult = '';
    }
    // isLoading(true);
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString('tokenHash');

    final response = await http.get(
        Uri.parse(
            'https://api.dalifood.app/Api/CustomerProduct/CustomerProducts/Search?ItemPerPage=5&PageNum=1$_queryResult'),
        headers: {
          "Content-Type": "application/json",
          'Authorization': 'Bearer $token',
        });

    if (response.statusCode == 200) {
      print('response.body Suggestion:::     ${response.body}');
      var responseBody = json.decode(response.body);

      // isLoading(false);
      return responseBody['\u0024values'].map<String>((json) {
        final productName = json['productName'];
        final customerName = json['customerName'];

        return '$productName، $customerName';
      }).toList();
    } else {
      // isLoading(false);
      throw Exception('Failed to load Suggestion Search Product');
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) => Container(
        color: Colors.black,
        child: FutureBuilder<List<String>>(
          future: fetchProductsNameThatSearched(subject: query),
          builder: (context, snapshot) {
            if (query.isEmpty) return buildNoSuggestions();

            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());
              default:
                if (snapshot.hasError) {
                  return buildNoSuggestions();
                } else {
                  print('snapshot.data::::::::::::        ${snapshot.data}');
                  return buildSuggestionsSuccess(snapshot.data);
                }
            }
          },
        ),
      );

  Widget buildNoSuggestions() => Center(
        child: Text(
          'No suggestions!',
          style: TextStyle(fontSize: 28, color: Colors.white),
        ),
      );

  Widget buildSuggestionsSuccess(List<String>? suggestions) => ListView.builder(
        itemCount: suggestions!.length,
        itemBuilder: (context, index) {
          final suggestion = suggestions[index];
          final queryText = suggestion.substring(0, query.length);
          final remainingText = suggestion.substring(query.length);

          print('suggestions:::::::::::::        $suggestions');

          return ListTile(
            onTap: () {
              query = suggestion;
              showResults(context);
            },
            leading: Icon(Icons.location_city),
            // title: Text(suggestion),
            title: RichText(
              text: TextSpan(
                text: queryText,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                children: [
                  TextSpan(
                    text: remainingText,
                    style: TextStyle(
                      color: Colors.white54,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );

  Widget buildResultSuccess(searchProducts) => Container(
      child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: searchProducts.length,
            itemBuilder: (context, index) {
              print('CatImg:::::  ${searchProducts[index].imageAddress}');
              String img = "https://dalifood.app/Images/Products/5.jpg";
              return Container(
                height: MediaQuery.of(context).size.width * 0.55,
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.all(5),
                width: MediaQuery.of(context).size.width * 0.92,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 3,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FoodDescScreen(
                                product: searchProducts[index],
                                productId: searchProducts[index].id,
                                productResturantName: searchProducts[index].customerName,
                                productFoodName:
                                    searchProducts[index].productName,
                                productDesc:
                                    searchProducts[index].description,
                                productPrice:
                                    searchProducts[index].price,
                                productOfferPrice:
                                    searchProducts[index].priceWithDiscount,
                                productPeykPrice:
                                    searchProducts[index].sendingPrice,
                                productImg:
                                    searchProducts[index].imageAddress,
                              ),
                            ),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 3,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(right: 5, left: 12),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      searchProducts[index].customerName,
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          searchProducts[index].productName,
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black54,
                                          ),
                                        ),
                                        searchProducts[index].sendingPrice != null
                                            ? Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.center,
                                                    children: [
                                                      Text(
                                                        '${searchProducts[index].price.toInt()}',
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          decoration:
                                                              TextDecoration
                                                                  .lineThrough,
                                                          color: Colors.red[900],
                                                        ),
                                                      ),
                                                      SizedBox(width: 5),
                                                      Text(
                                                        'تومن',
                                                        style: TextStyle(
                                                          color: Colors.black45,
                                                          fontSize: 12,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.center,
                                                    children: [
                                                      Text(
                                                        '${searchProducts[index].priceWithDiscount}',
                                                        style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color:
                                                              Colors.green[900],
                                                        ),
                                                      ),
                                                      SizedBox(width: 5),
                                                      Text(
                                                        'تومن',
                                                        style: TextStyle(
                                                          color: Colors.black45,
                                                          fontSize: 12,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              )
                                            : Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    '${searchProducts[index].price.toInt()}',
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.green[900],
                                                    ),
                                                  ),
                                                  SizedBox(width: 5),
                                                  Text(
                                                    'تومن',
                                                    style: TextStyle(
                                                      color: Colors.black45,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                      ],
                                    ),
                                    SizedBox(
                                      width:
                                          MediaQuery.of(context).size.width * 0.9,
                                      child: Text(
                                        searchProducts[index].description,
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black54,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  image: DecorationImage(
                                    image: NetworkImage('https://p.kindpng.com/picc/s/79-798754_hoteles-y-centros-vacacionales-dish-placeholder-hd-png.png'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.sports_motorsports_outlined,
                                color: Color(0xFFe91e63),
                              ),
                              SizedBox(width: 5),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    '${searchProducts[index].sendingPrice.toInt()}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    'تومن',
                                    style: TextStyle(
                                      color: Colors.black45,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          // Row(
                          //   children: [
                          //     IconButton(
                          //       onPressed: () {
                          //         cartController.addToCart(
                          //             productController.products[index]);
                          //       },
                          //       icon: Icon(Icons.add_box_outlined),
                          //       iconSize: 37,
                          //       color: Color(0xFFe91e63),
                          //     ),
                          //     SizedBox(width: 10),
                          //     Obx(
                          //       () => Text(
                          //         '${cartController.cartItem.length}',
                          //         style: TextStyle(
                          //           color: Colors.black,
                          //           fontSize: 17,
                          //           fontWeight: FontWeight.bold,
                          //         ),
                          //       ),
                          //     ),
                          //     SizedBox(width: 10),
                          //     IconButton(
                          //         onPressed: () {
                          //           cartController.deleteFtomCart(
                          //               productController.products[index]);
                          //         },
                          //         icon: Icon(
                          //             Icons.indeterminate_check_box_outlined),
                          //         iconSize: 37,
                          //         color: Colors.black54),
                          //   ],
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
    );
}

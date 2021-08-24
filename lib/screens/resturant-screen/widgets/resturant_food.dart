import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:dali_food/controllers/product_controller.dart';
import 'package:dali_food/screens/foodDesc-screen/foodDesc_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResturantFood extends StatefulWidget {
  const ResturantFood({Key? key}) : super(key: key);

  @override
  _ResturantFoodState createState() => _ResturantFoodState();
}

class _ResturantFoodState extends State<ResturantFood>
    with SingleTickerProviderStateMixin {
  final productsController = Get.put(ProductsFirstlyController());

  @override
  Widget build(BuildContext context) {
    final List<Tab> tabs = <Tab>[
      new Tab(text: "پر طرفدارترین"),
      new Tab(text: "برگرها"),
      new Tab(text: "پیتزا"),
      new Tab(text: "سبزیجات"),
      new Tab(text: "نوشیدنی سرد")
    ];

    TabController? _tabController;

    @override
    void initState() {
      super.initState();
      _tabController = new TabController(vsync: this, length: tabs.length);
    }

    @override
    void dispose() {
      _tabController!.dispose();
      super.dispose();
    }

    return DefaultTabController(
      length: 5,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: TabBar(
              isScrollable: true,
              unselectedLabelColor: Colors.grey,
              labelColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: new BubbleTabIndicator(
                indicatorHeight: 40.0,
                indicatorColor: Colors.blueAccent,
                tabBarIndicatorSize: TabBarIndicatorSize.tab,
                // Other flags
                // indicatorRadius: 1,
                insets: EdgeInsets.all(1),
                padding: EdgeInsets.all(10),
              ),
              tabs: tabs,
              controller: _tabController,
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 1.8,
            child: TabBarView(
              controller: _tabController,
              children: tabs.map((Tab tab) {
                return Container(
                  child: GetX<ProductsFirstlyController>(
                      builder: (productController) {
                    if (productController.isLoading.value) {
                      return Center(child: CircularProgressIndicator());
                    } else {
                      return ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: productController.products.length,
                        itemBuilder: (context, index) {
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
                                            product: productsController
                                                .products[index],
                                            productId: productController
                                                .products[index].id,
                                            productResturantName:
                                                productsController
                                                    .products[index]
                                                    .customerName,
                                            productFoodName: productsController
                                                .products[index].productName,
                                            productDesc: productsController
                                                .products[index].description,
                                            productPrice: productsController
                                                .products[index].price,
                                            productOfferPrice:
                                                productsController
                                                    .products[index]
                                                    .priceWithDiscount,
                                            productPeykPrice: productsController
                                                .products[index].sendingPrice,
                                            productImg: productsController
                                                .products[index].imageAddress,
                                          ),
                                        ),
                                      );
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          flex: 3,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                right: 5, left: 12),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  productController
                                                      .products[index]
                                                      .customerName,
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      productController
                                                          .products[index]
                                                          .productName,
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Colors.black54,
                                                      ),
                                                    ),
                                                    productController
                                                                .products[index]
                                                                .sendingPrice !=
                                                            null
                                                        ? Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .end,
                                                            children: [
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    '${productController.products[index].price.toInt()}',
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          12,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      decoration:
                                                                          TextDecoration
                                                                              .lineThrough,
                                                                      color: Colors
                                                                              .red[
                                                                          900],
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                      width: 5),
                                                                  Text(
                                                                    'تومن',
                                                                    style:
                                                                        TextStyle(
                                                                      color: Colors
                                                                          .black45,
                                                                      fontSize:
                                                                          12,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    '${productController.products[index].priceWithDiscount}',
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          15,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      color: Colors
                                                                              .green[
                                                                          900],
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                      width: 5),
                                                                  Text(
                                                                    'تومن',
                                                                    style:
                                                                        TextStyle(
                                                                      color: Colors
                                                                          .black45,
                                                                      fontSize:
                                                                          12,
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
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                '${productController.products[index].price.toInt()}',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                          .green[
                                                                      900],
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                  width: 5),
                                                              Text(
                                                                'تومن',
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .black45,
                                                                  fontSize: 12,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.9,
                                                  child: Text(
                                                    productController
                                                        .products[index]
                                                        .description,
                                                    maxLines: 3,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w600,
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
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                    productsController
                                                                .products[index]
                                                                .imageAddress ==
                                                            null
                                                        ? 'https://cuculi.com/assets/images/meal-default-img.jpg'
                                                        : productsController
                                                            .products[index]
                                                            .imageAddress!),
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.sports_motorsports_outlined,
                                            color: Color(0xFFe91e63),
                                          ),
                                          SizedBox(width: 5),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                '${productController.products[index].sendingPrice.toInt()}',
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
                      );
                    }
                  }),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

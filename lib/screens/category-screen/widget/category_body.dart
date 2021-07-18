import 'package:dali_food/controllers/cart_controller.dart';
import 'package:dali_food/controllers/product_controller.dart';
import 'package:dali_food/screens/foodDesc-screen/foodDesc_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryBody extends StatelessWidget {
  CategoryBody({Key? key}) : super(key: key);

  final productsController = Get.put(ProductsController());
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GetX<ProductsController>(builder: (productController) {
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
                              product: productsController.products[index],
                              productId: productController.products[index].id,
                              productResturantName: productsController
                                  .products[index].resturantName,
                              productFoodName:
                                  productsController.products[index].foodName,
                              productDesc:
                                  productsController.products[index].foodDesc,
                              productPrice:
                                  productsController.products[index].price,
                              productOfferPrice:
                                  productsController.products[index].offerPrice,
                              productPeykPrice:
                                  productsController.products[index].peykPrice,
                              productImg:
                                  productsController.products[index].img,
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
                                    productController
                                        .products[index].resturantName,
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
                                        productController
                                            .products[index].foodName,
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black54,
                                        ),
                                      ),
                                      productController
                                                  .products[index].offerPrice !=
                                              null
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
                                                      '${productController.products[index].price.toInt()}',
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
                                                      '${productController.products[index].offerPrice}',
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
                                                  '${productController.products[index].price.toInt()}',
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
                                      productController
                                          .products[index].foodDesc,
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
                                  image: AssetImage(
                                      productController.products[index].img[0]),
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
                                  '${productController.products[index].peykPrice.toInt()}',
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
      }),
    );
  }
}

import 'package:dali_food/controllers/resturant_controller.dart';
import 'package:dali_food/screens/category-screen/category_screen.dart';
import 'package:dali_food/screens/resturant-screen/resturant_screen.dart';
import 'package:dali_food/screens/resturantDesc-screen/resturantDesc_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResturantsHomeList extends StatelessWidget {
  String nameTopic;
  String catLinkName;

  ResturantsHomeList({
    Key? key,
    required this.nameTopic,
    required this.catLinkName,
  }) : super(key: key);

  final resturantsController = Get.put(ResturantsFirstlyController());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width * 0.6,
      padding: EdgeInsets.all(5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    nameTopic,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => CategoryScreen(),
                      //   ),
                      // );
                    },
                    child: Text(
                      'بازم هست',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: GetX<ResturantsFirstlyController>(
                builder: (resturantsController) {
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                itemCount: resturantsController.resturants.length,
                itemBuilder: (context, index) {
                  print(
                      'resturantsController.resturants[index]:::   ${resturantsController.resturants[index]}');
                  print(
                      'resturantsController.resturants[index].description:::   ${resturantsController.resturants[index].description}');
                  return InkWell(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => ResturantScreen(
                      //       name: resturantsController.resturants[index].name,
                      //       type: resturantsController.resturants[index].type,
                      //       latitude:
                      //           resturantsController.resturants[index].latitude,
                      //       longitude: resturantsController
                      //           .resturants[index].longitude,
                      //       city: resturantsController.resturants[index].city,
                      //       address:
                      //           resturantsController.resturants[index].address,
                      //       sendingPrice: resturantsController
                      //           .resturants[index].sendingPrice,
                      //       description: resturantsController
                      //           .resturants[index].description,
                      //       isInMyFavorite: resturantsController
                      //           .resturants[index].isInMyFavorite,
                      //       rate: resturantsController.resturants[index].rate,
                      //       distance:
                      //           resturantsController.resturants[index].distance,
                      //       imageAddress: resturantsController
                      //           .resturants[index].imageAddress,
                      //     ),
                      //   ),
                      // );
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.width * 0.6,
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.all(5),
                      width: MediaQuery.of(context).size.width * 0.92,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.white,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 3,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    height:
                                        MediaQuery.of(context).size.width * 0.5,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          resturantsController.resturants[index].imageAddress == null?
                                    'https://cuculi.com/assets/images/meal-default-img.jpg'
                                    :
                                    resturantsController.resturants[index].imageAddress!,
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 5),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          resturantsController
                                              .resturants[index].name,
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.9,
                                          child: Text(
                                            resturantsController
                                                .resturants[index].description!,
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
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
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
                                          '${resturantsController.resturants[index].sendingPrice}',
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
                                SizedBox(
                                  width: 200,
                                  child: Text(
                                    resturantsController
                                        .resturants[index].address,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    maxLines: 1,
                                    softWrap: false,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.greenAccent[700],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}

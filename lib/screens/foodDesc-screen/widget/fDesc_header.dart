import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:dali_food/controllers/product_controller.dart';

class FDescHeader extends StatelessWidget {
  List<String> img;
  FDescHeader({
    Key? key,
    required this.img,
  }) : super(key: key);
  // final productsController = Get.put(ProductsController());
  @override
  Widget build(BuildContext context) {
    int selectedImage = 0;
    return Container(
      child: CarouselSlider(
        options: CarouselOptions(
          height: 260.0,
          // aspectRatio: 16 / 9,
          viewportFraction: 1,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: false,
          autoPlayInterval: Duration(seconds: 6),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayCurve: Curves.easeInOutBack,
          // enlargeCenterPage: true,
          scrollDirection: Axis.horizontal,
        ),
        items: img.map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                // height: 90,
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 35,
                ),
                decoration: BoxDecoration(
                  image:
                      DecorationImage(image: AssetImage(i), fit: BoxFit.cover),
                  // color: Color(int.parse(i.img)),
                  borderRadius: BorderRadius.circular(0),
                ),
                // child: Text('Image:  $i'),
                // child: Text.rich(
                //   TextSpan(
                //     // style: TextStyle(color: Color(int.parse(i.color))),
                //     children: [
                //       TextSpan(
                //         text: i.title + "\n",
                //         style: TextStyle(
                //           fontSize: 16,
                //         ),
                //       ),
                //       TextSpan(
                //         text: i.detail,
                //         style: TextStyle(
                //             fontSize: 24, fontFamily: "LalezarRegular"),
                //       ),
                //     ],
                //   ),
                // ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}

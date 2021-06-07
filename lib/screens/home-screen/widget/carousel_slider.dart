import 'package:carousel_slider/carousel_slider.dart';
import 'package:dali_food/models/slider.dart';
import 'package:flutter/material.dart';

class CarouselSliderMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CarouselSlider(
        options: CarouselOptions(
          height: 160.0,
          // aspectRatio: 16 / 9,
          viewportFraction: 0.9,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 6),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayCurve: Curves.easeInOutBack,
          // enlargeCenterPage: true,
          scrollDirection: Axis.horizontal,
        ),
        items: sliderMain.map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                // height: 90,
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 35,
                ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(i.img), fit: BoxFit.cover),
                  // color: Color(int.parse(i.img)),
                  borderRadius: BorderRadius.circular(20),
                ),
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

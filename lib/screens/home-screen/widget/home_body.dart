import 'package:dali_food/screens/home-screen/widget/TopMenus.dart';
import 'package:dali_food/screens/home-screen/widget/carousel_slider.dart';
import 'package:dali_food/screens/home-screen/widget/foods_homeList.dart';
import 'package:dali_food/screens/home-screen/widget/logo.dart';
import 'package:dali_food/screens/home-screen/widget/off_list.dart';
import 'package:dali_food/screens/home-screen/widget/resturants_homeList.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Logo(),
            CarouselSliderMain(),
            TopMenus(),
            OffList(),
            ResturantsHomeList(
              nameTopic: 'بهترین رستوران ها',
              catLinkName: '',
            ),
            FoodsHomeList(
              nameTopic: 'بهترین غذاها',
              catLinkName: '',
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

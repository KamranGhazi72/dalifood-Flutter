import 'package:dali_food/screens/home-screen/widget/TopMenus.dart';
import 'package:dali_food/screens/home-screen/widget/carousel_slider.dart';
import 'package:dali_food/screens/home-screen/widget/foods_homeList.dart';
import 'package:dali_food/screens/home-screen/widget/logo.dart';
import 'package:dali_food/screens/home-screen/widget/off_list.dart';
import 'package:dali_food/screens/home-screen/widget/resturants_homeList.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  LatLng _center = LatLng(33.51189550112129, 48.35531868707115);
  Position? currentLocation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserLocation();
  }

  Future<Position> locateUser() async {
    return Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  getUserLocation() async {
    currentLocation = await locateUser();
    setState(() {
      _center = LatLng(currentLocation!.latitude, currentLocation!.longitude);
    });
    print('center $_center');
  }

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

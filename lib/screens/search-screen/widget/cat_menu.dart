import 'package:dali_food/screens/category-screen/category_screen.dart';
import 'package:flutter/material.dart';

class CatMenu extends StatelessWidget {
  const CatMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 5),
      height: 45,
      child: ListView(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          CatMenuTiles(name: "برگر", imageUrl: "berger3.png", slug: ""),
          CatMenuTiles(name: "دریایی", imageUrl: "slide7.jpg", slug: ""),
          CatMenuTiles(name: "پیتزا", imageUrl: "pizza1.jpg", slug: ""),
          CatMenuTiles(name: "کیک", imageUrl: "ic_cake.png", slug: ""),
          CatMenuTiles(name: "ایرانی", imageUrl: "kabab1.jpg", slug: ""),
          CatMenuTiles(name: "نوشابه", imageUrl: "ic_soft_drink.png", slug: ""),
          CatMenuTiles(name: "سوخاری", imageUrl: "food2.jpg", slug: ""),
          CatMenuTiles(name: "ایتالیایی", imageUrl: "food1.jpg", slug: ""),
        ],
      ),
    );
  }
}

class CatMenuTiles extends StatelessWidget {
  String name;
  String imageUrl;
  String slug;

  CatMenuTiles(
      {Key? key,
      required this.name,
      required this.imageUrl,
      required this.slug})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryScreen(),
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
              image: AssetImage(
                'assets/images/' + imageUrl,
              ),
              fit: BoxFit.cover),
          // color: Color(int.parse(i.img)),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text.rich(
            TextSpan(
              text: name,
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
  }
}

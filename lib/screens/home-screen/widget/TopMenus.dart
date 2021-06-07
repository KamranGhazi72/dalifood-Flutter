import 'package:flutter/material.dart';

class TopMenus extends StatefulWidget {
  @override
  _TopMenusState createState() => _TopMenusState();
}

class _TopMenusState extends State<TopMenus> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          TopMenuTiles(name: "برگر", imageUrl: "ic_burger", slug: ""),
          TopMenuTiles(name: "دریایی", imageUrl: "ic_sushi", slug: ""),
          TopMenuTiles(name: "پیتزا", imageUrl: "ic_pizza", slug: ""),
          TopMenuTiles(name: "کیک", imageUrl: "ic_cake", slug: ""),
          TopMenuTiles(name: "ایرانی", imageUrl: "ic_ice_cream", slug: ""),
          TopMenuTiles(name: "نوشابه", imageUrl: "ic_soft_drink", slug: ""),
          TopMenuTiles(name: "سوخاری", imageUrl: "ic_burger", slug: ""),
          TopMenuTiles(name: "ایتالیایی", imageUrl: "ic_sushi", slug: ""),
        ],
      ),
    );
  }
}

class TopMenuTiles extends StatelessWidget {
  String name;
  String imageUrl;
  String slug;

  TopMenuTiles(
      {Key? key,
      required this.name,
      required this.imageUrl,
      required this.slug})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 10, right: 5, top: 5, bottom: 5),
            // decoration: new BoxDecoration(boxShadow: [
            //   new BoxShadow(
            //     color: Color(0xFFfae3e2),
            //     blurRadius: 25.0,
            //     offset: Offset(0.0, 0.75),
            //   ),
            // ]),
            child: Card(
                color: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(3.0),
                  ),
                ),
                child: Container(
                  width: 50,
                  height: 50,
                  child: Center(
                      child: Image.asset(
                    'assets/images/' + imageUrl + ".png",
                    width: 24,
                    height: 24,
                  )),
                )),
          ),
          Text(name,
              style: TextStyle(
                  color: Color(0xFF6e6e71),
                  fontSize: 14,
                  fontWeight: FontWeight.w400)),
        ],
      ),
    );
  }
}

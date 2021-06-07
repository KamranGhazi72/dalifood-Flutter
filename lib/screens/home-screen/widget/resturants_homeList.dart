import 'package:flutter/material.dart';

class ResturantsHomeList extends StatefulWidget {
  const ResturantsHomeList({Key? key}) : super(key: key);

  @override
  _ResturantsHomeListState createState() => _ResturantsHomeListState();
}

class _ResturantsHomeListState extends State<ResturantsHomeList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      color: Colors.amber,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('بهترین رستوران ها'),
              Text('بازم هست'),
            ],
          ),
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              children: <Widget>[
                ResturantBox(
                  id: 0,
                  name: 'رستوان ریحون',
                  desc:
                      'جوجه کباب بدون استخوان، فیله ماهی، میگو کبابی، کباب ترش، کباب چنجه ،کوبیده، قرمه سبزی، کباب برگ',
                  address: 'خیابان آزادی - روبرو بانک ملت',
                  peykPrice: 1500,
                  img: 'assets/images/food2.jpg',
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ResturantBox extends StatelessWidget {
  int id;
  String name;
  String desc;
  String address;
  double peykPrice;
  String img;

  ResturantBox(
      {Key? key,
      required this.id,
      required this.name,
      required this.desc,
      required this.address,
      required this.peykPrice,
      required this.img})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 2,
                  child: Image.asset(
                    img,
                    height: 150,
                    width: 150,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(name),
                      Text(
                        desc,
                        maxLines: 3,
                      ),
                    ],
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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.sports_motorsports_outlined),
                    Text('${peykPrice}'),
                  ],
                ),
                Text(address),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

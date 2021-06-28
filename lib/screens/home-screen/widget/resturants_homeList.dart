import 'package:dali_food/screens/category-screen/category_screen.dart';
import 'package:dali_food/screens/resturantDesc-screen/resturantDesc_screen.dart';
import 'package:flutter/material.dart';

class ResturantsHomeList extends StatelessWidget {
  String nameTopic;
  String catLinkName;

  ResturantsHomeList({
    Key? key,
    required this.nameTopic,
    required this.catLinkName,
  }) : super(key: key);

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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CategoryScreen(),
                        ),
                      );
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
                ),
                ResturantBox(
                  id: 1,
                  name: 'اکبر جوجه',
                  desc:
                      'جوجه کباب ، فسنجون، کباب برگ، آش هالاو، دنده کباب، کباب سالمون، بال مرغ عسلی، کباب گوشت و سبزیجات',
                  address: 'خیابان آزادی - روبرو بانک ملت',
                  peykPrice: 2000,
                  img: 'assets/images/food4.jpg',
                ),
                ResturantBox(
                  id: 3,
                  name: 'فست فود جگوار',
                  desc: 'چیزبرگر، پیتزا پپرونی، استیک',
                  address: 'خیابان دوم پامنار - روبرو پارک جواهری',
                  peykPrice: 4500,
                  img: 'assets/images/food1.jpg',
                ),
                ResturantBox(
                  id: 4,
                  name: 'ایتالین',
                  desc:
                      'اسپاگتی، روماندو، استیک گوشت، پیتزا مارگاریتا، اسنک‌های ونیزی، ریزیتو اسکامپی، بیستکا الا فیورنتینا، پارمیگینا ملانزین',
                  address: 'ولنجک - میدان رخش - جنب پارک',
                  peykPrice: 3500,
                  img: 'assets/images/berger1.jpg',
                ),
                ResturantBox(
                  id: 2,
                  name: 'علی بابا',
                  desc:
                      'جوجه، برگ، شیشلیک، سلطانی، چلوکباب کوبیده، جوجه کباب بدون استخوان، فیله ماهی، میگو کبابی، کباب ترش، کباب چنجه',
                  address: 'خیابان دوم پامنار - روبرو پارک جواهری',
                  peykPrice: 5000,
                  img: 'assets/images/berger3.png',
                ),
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
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ResturantDescScreen(),
          ),
        );
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
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        image: DecorationImage(
                          image: AssetImage(img),
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.9,
                            child: Text(
                              desc,
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
                            '${peykPrice.toInt()}',
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
                  Text(
                    address,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.greenAccent[700],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

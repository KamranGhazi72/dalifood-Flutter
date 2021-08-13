import 'package:dali_food/screens/category-screen/widget/category_body.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  CategoryScreen({Key? key}) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF535353),
        centerTitle: true,
        title: Column(
          children: [
            Text('دسته بندی',
                style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
            // Text('${demoCarts.length} آیتم',
            //     style: TextStyle(
            //         fontSize: 13,
            //         fontWeight: FontWeight.bold,
            //         color: Colors.black38)),
          ],
        ),
      ),
      body: CategoryBody(),
    );
  }
}

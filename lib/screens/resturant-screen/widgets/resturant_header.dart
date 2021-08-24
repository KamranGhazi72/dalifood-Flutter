import 'package:flutter/material.dart';

class ResturantHeader extends StatelessWidget {
  String? imageAddress;
  ResturantHeader({Key? key, this.imageAddress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 120,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(imageAddress == null
                ? 'https://cuculi.com/assets/images/meal-default-img.jpg'
                : imageAddress!),
            fit: BoxFit.cover),
      ),
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          Container(
            margin: EdgeInsets.only(right: 13),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(30)),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_outlined,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

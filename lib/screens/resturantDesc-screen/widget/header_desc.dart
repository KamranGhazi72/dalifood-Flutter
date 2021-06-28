import 'package:flutter/material.dart';

class HeaderDesc extends StatelessWidget {
  const HeaderDesc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'فست فود جگوار',
            style: TextStyle(
              color: Colors.black,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'غذا های رستوران ما: ' +
                'جوجه کباب بدون استخوان، فیله ماهی، میگو کبابی، کباب ترش، کباب چنجه ،کوبیده، قرمه سبزی، کباب برگ',
            style: TextStyle(
              color: Colors.black,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }
}

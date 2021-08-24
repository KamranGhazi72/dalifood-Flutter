import 'package:flutter/material.dart';

class HeaderDesc extends StatelessWidget {
  String name;
  String type;
  String? description;

  HeaderDesc({
    Key? key,
    required this.name,
    required this.type,
    this.description,
  }) : super(key: key);

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
            type + ' ' + name,
            style: TextStyle(
              color: Colors.black,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'غذا های رستوران ما: ' +
                description!,
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

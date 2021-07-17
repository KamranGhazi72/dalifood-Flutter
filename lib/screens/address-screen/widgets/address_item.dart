import 'package:flutter/material.dart';

class AddressItem extends StatelessWidget {
  String adress;
  AddressItem({
    Key? key,
    required this.adress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Color(0xFFEEEEEE),
            ),
            color: Colors.white,
            borderRadius: BorderRadius.circular(26)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.4,
              child: Text(
                adress,
                style: TextStyle(color: Colors.black87),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Icon(
                Icons.edit_outlined,
                color: Colors.lightBlueAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
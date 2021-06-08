import 'package:flutter/material.dart';

class SearchInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25, vertical: 2),
      width: MediaQuery.of(context).size.width * 0.875,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 1, color: Color(0xFFEEEEEE)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        onChanged: (value) => print(value),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 6),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            hintText: "جستجو براساس نام دوره، دسته بندی",
            hintStyle: TextStyle(
                color: Color(0xFFC9D1D8), fontWeight: FontWeight.bold),
            prefixIcon: Icon(Icons.search)),
      ),
    );
  }
}

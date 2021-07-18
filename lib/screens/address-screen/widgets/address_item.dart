import 'package:dali_food/screens/cart-screen/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';

class AddressItem extends StatelessWidget {
  String adress;
  AddressItem({
    Key? key,
    required this.adress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LocalStorage storage = new LocalStorage('todo_app');

    _saveToStorage() {
      storage.setItem('AddressChoised', adress);
    }

    return InkWell(
      onTap: () {
        _saveToStorage();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => CartScreen(),
          ),
        );
      },
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

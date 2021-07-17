import 'package:dali_food/models/address.dart';
import 'package:dali_food/screens/address-screen/widgets/address_item.dart';
import 'package:flutter/material.dart';

class AddressBody extends StatefulWidget {
  const AddressBody({Key? key}) : super(key: key);

  @override
  _AddressBodyState createState() => _AddressBodyState();
}

class _AddressBodyState extends State<AddressBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'آدرس های ذخیره شده شما',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: [
                      Icon(
                        Icons.add_outlined,
                        color: Colors.green,
                      ),
                      Text(
                        'آدرس جدید',
                        style: TextStyle(
                          color: Colors.green[600],
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Container(
              height: MediaQuery.of(context).size.height / 1.2,
              child: ListView.builder(
                itemCount: addr.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(0),
                    child: Dismissible(
                      key: Key(addr[index].id.toString()),
                      direction: DismissDirection.endToStart,
                      onDismissed: (direction) {
                        setState(() {
                          addr.removeAt(index);
                        });
                      },
                      background: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color: Color(0xFFFFE6E6),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          children: [
                            Spacer(),
                            Icon(Icons.auto_delete_outlined,
                                color: Color(0xFFFF7642)),
                          ],
                        ),
                      ),
                      child: AddressItem(adress: addr[index].addressText),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

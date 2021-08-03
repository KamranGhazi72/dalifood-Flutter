import 'package:dali_food/models/address.dart';
import 'package:dali_food/screens/address-screen/widgets/address_item.dart';
import 'package:dali_food/screens/address-screen/widgets/map_res.dart';
import 'package:flutter/material.dart';

class AddressBody extends StatefulWidget {
  const AddressBody({Key? key}) : super(key: key);

  @override
  _AddressBodyState createState() => _AddressBodyState();
}

class _AddressBodyState extends State<AddressBody> {
  bool _loading = true;
  int _currentPage = 1;
  List<CustomerAddress> _address = [];
  ScrollController _listScrollController = new ScrollController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _getAllAddresses();

    _listScrollController.addListener(() {
      double maxScroll = _listScrollController.position.maxScrollExtent;
      double currentScroll = _listScrollController.position.pixels;

      if (maxScroll - currentScroll <= 200) {
        if (!_loading) {
          _getAllAddresses(page: _currentPage + 1);
          _currentPage++;
        }
      }
    });
  }

  _getAllAddresses({int page: 1}) async {
    var response = await getAllAddresses(page);
    print(response['address']);

    setState(() {
      _address.addAll(response['address']);
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _loading && _address.length == 0
        ? Center(
            child: CircularProgressIndicator(),
          )
        : SingleChildScrollView(
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
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MapRes(),
                            ),
                          );
                        },
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
                    height: MediaQuery.of(context).size.height / 1.25,
                    child: ListView.builder(
                      controller: _listScrollController,
                      itemCount: _address.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(0),
                          child: Dismissible(
                            key: Key(_address[index].id.toString()),
                            direction: DismissDirection.endToStart,
                            onDismissed: (direction) {
                              setState(() {
                                _address.removeAt(index);
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
                            child: AddressItem(
                                adress: _address[index].textAddress),
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

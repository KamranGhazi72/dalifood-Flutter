import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';

class OfferListBody extends StatelessWidget {
  const OfferListBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height - 100,
          child: ListView.builder(
            itemCount: 8,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFEEEEEE),
                      blurRadius: 3,
                      spreadRadius: 3,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '50% تخفیف اولین سفارش دالی فود',
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'فعال',
                          style: TextStyle(
                            color: Colors.green[500],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      'با وارد کردن کد تخفیف می‌توانید از %50 تخفیف اولین سفارش غذا دالی فود با سقف تخفیف 10 هزار تومان بهره‌مند ‌شوید. لازم به ذکر است این کد تخفیف فقط برای سرویس دالی فود اعمال نمی‌شود.',
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.black12),
                        onPressed: () {
                          FlutterClipboard.copy('wjehwjiojidjikjk')
                              .then((value) => print('copied'));
                        },
                        child: Text('wjehwjiojidjikjk'),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

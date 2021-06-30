import 'package:dali_food/controllers/count_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Logo extends StatelessWidget {
  Logo({Key? key}) : super(key: key);

  final countController = Get.put(CountController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 17),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.png',
                height: 80,
                width: 80,
              ),
              // Obx(
              //   () => ElevatedButton(
              //     onPressed: () {
              //       countController.increament();
              //     },
              //     child: Text('کانتررررر'),
              //   ),
              // ),
              Text(
                'Dali fooD',
                style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

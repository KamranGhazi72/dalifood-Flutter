import 'package:dali_food/screens/sign_in/components/InputFields.dart';
import 'package:flutter/material.dart';
import 'package:validators/validators.dart';

class FormContainer extends StatelessWidget {
  final formKey;
  final phoneOnSaved;
  // final passwordOnSaved;

  FormContainer({required this.formKey, this.phoneOnSaved});

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: new Column(
        children: <Widget>[
          new Form(
            key: formKey,
            child: new Column(
              children: <Widget>[
                new InputFieldArea(
                    hint: "شماره موبایل",
                    obscure: false,
                    icon: Icons.phone_iphone_outlined,
                    validator: (String? value) {
                      if (!isNumeric(value!) &&
                          value.length < 11 &&
                          value.length > 11) {
                        return 'شماره وارد شده معتبر نیست';
                      }
                    },
                    onSaved: phoneOnSaved),
                // new InputFieldArea(
                //     hint: "پسورد",
                //     obscure: true,
                //     icon: Icons.lock_open,
                //     validator: (String? value) {
                //       if (value!.length < 5) {
                //         return 'طول پسورد باید حداقل 6 کاراکتر باشد';
                //       }
                //     },
                //     onSaved: passwordOnSaved),
              ],
            ),
          )
        ],
      ),
    );
  }
}

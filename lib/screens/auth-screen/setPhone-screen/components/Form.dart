
import 'package:dali_food/screens/auth-screen/setPhone-screen/components/InputFields.dart';
import 'package:flutter/material.dart';
import 'package:validators/validators.dart';

class FormContainer extends StatelessWidget {
  final formKey;
  final phoneOnSaved;
  final passwordOnSaved;

  FormContainer(
      {required this.formKey, this.phoneOnSaved, this.passwordOnSaved});

  @override
  Widget build(BuildContext context) {
    bool validateStructure(String value) {
      String pattern =
          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
      RegExp regExp = new RegExp(pattern);
      return regExp.hasMatch(value);
    }

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
                    if (value!.isEmpty) {
                      return 'لطفا شماره خود را وارد بفرمایید';
                    } else if (!isNumeric(value)) {
                      return 'شماره وارد شده معتبر نیست';
                    } else if (value.length < 11) {
                      return 'شماره وارد شده باید 11 کاراکتر  باشد';
                    } else if (value.length > 11) {
                      return 'شماره وارد شده باید 11 کاراکتر  باشد';
                    }
                  },
                  onSaved: phoneOnSaved,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

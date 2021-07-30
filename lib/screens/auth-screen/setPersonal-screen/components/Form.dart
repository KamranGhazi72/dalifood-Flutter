import 'package:dali_food/screens/auth-screen/sign_in/components/InputFields.dart';
import 'package:flutter/material.dart';
import 'package:validators/validators.dart';

class FormContainer extends StatelessWidget {
  final formKey;
  final nameOnSaved;
  final familyOnSaved;
  final passwordOnSaved;
  final confirmPasswordOnSaved;

  FormContainer(
      {required this.formKey, this.nameOnSaved, this.passwordOnSaved, this.familyOnSaved, this.confirmPasswordOnSaved});

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
                  hint: "نام",
                  obscure: false,
                  icon: Icons.phone_iphone_outlined,
                  validator: (String? value) {
                    // if (value!.isEmpty) {
                    //   return 'لطفا شماره خود را وارد بفرمایید';
                    // // } else if (!isNumeric(value)) {
                    // //   return 'شماره وارد شده معتبر نیست';
                    // } else if (value.length < 11) {
                    //   return 'شماره وارد شده باید 11 کاراکتر  باشد';
                    // } else if (value.length > 11) {
                    //   return 'شماره وارد شده باید 11 کاراکتر  باشد';
                    // }
                  },
                  onSaved: nameOnSaved,
                ),
                new InputFieldArea(
                  hint: "نام خانوادگی",
                  obscure: false,
                  icon: Icons.phone_iphone_outlined,
                  validator: (String? value) {
                    // if (value!.isEmpty) {
                    //   return 'لطفا شماره خود را وارد بفرمایید';
                    // } else if (!isNumeric(value)) {
                    //   return 'شماره وارد شده معتبر نیست';
                    // } else if (value.length < 11) {
                    //   return 'شماره وارد شده باید 11 کاراکتر  باشد';
                    // } else if (value.length > 11) {
                    //   return 'شماره وارد شده باید 11 کاراکتر  باشد';
                    // }
                  },
                  onSaved: familyOnSaved,
                ),
                new InputFieldArea(
                    hint: "پسورد",
                    obscure: true,
                    icon: Icons.lock_open,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'لطفا رمز خود را وارد بفرمایید';
                        // } else if (!isNumeric(value)) {
                        //   return 'رمز وارد شده معتبر نیست';
                      } else if (!validateStructure(value)) {
                        return 'رمز وارد شده باید دارای حروف بزرگ و کوچک انگلیسی \n ، یکی از (!،#،*،@ و...) و اعداد باشد';
                      }
                    },
                    onSaved: passwordOnSaved),
                new InputFieldArea(
                    hint: "تکرار پسورد",
                    obscure: true,
                    icon: Icons.lock_open,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'لطفا رمز خود را وارد بفرمایید';
                        } else if (value == passwordOnSaved) {
                          return 'با پسورد وارد شده مطابقت ندارد';
                      } else if (!validateStructure(value)) {
                        return 'رمز وارد شده باید دارای حروف بزرگ و کوچک انگلیسی \n ، یکی از (!،#،*،@ و...) و اعداد باشد';
                      }
                    },
                    onSaved: confirmPasswordOnSaved),
              ],
            ),
          )
        ],
      ),
    );
  }
}

import 'package:dali_food/screens/home-screen/home_screen.dart';
import 'package:dali_food/widgets/default_button.dart';
import 'package:dali_food/widgets/form_error.dart';
import 'package:flutter/material.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  final RegExp emailValidatorRegExp = RegExp(r"^(?:[+0]9)?[0-9]{10}$");
  String? phone;
  bool remember = false;
  var errors = [];

  void addError(String error) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError(String error) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: 30),
          FormError(errors: []),
          SizedBox(height: 20),
          DefaultButton(
            text: "ارسال کد اعتبار سنجی",
            press: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                // if all are valid then go to success screen
                // KeyboardUtil.hideKeyboard(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => phone = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError('kEmailNullError');
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError('kInvalidEmailError');
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError('kEmailNullError');
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError('kInvalidEmailError');
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "ایمیل",
        hintText: "ایمیل خود را وارد کنید",
        border: InputBorder.none,
        fillColor: Colors.white,
        focusColor: Colors.amber,

        floatingLabelBehavior: FloatingLabelBehavior.always,
        // contentPadding: EdgeInsets.only(left: 14.0, bottom: 6.0, top: 8.0),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(10.0),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(10.0),
        ),
        // suffixIcon: CustomSurffixIcon(svgIcon: "assets/images/mail-icon.png"),
      ),
    );
  }
}

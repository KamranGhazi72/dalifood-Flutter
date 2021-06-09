import 'package:dali_food/screens/profile-screen/widget/customer_avatar.dart';
import 'package:dali_food/screens/profile-screen/widget/profile_items.dart';
import 'package:flutter/material.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomerAvatar(),
        ProfileItems(),
      ],
    );
  }
}

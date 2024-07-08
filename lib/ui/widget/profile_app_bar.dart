import 'package:flutter/material.dart';
import 'package:task_manage_1_project/ui/controller/auth_controller.dart';
import 'package:task_manage_1_project/ui/screen/auth/sign_in_screen.dart';
import 'package:task_manage_1_project/ui/screen/update_profile.dart';

import '../utility/app_colors.dart';

AppBar profileAppBar(context, [bool fromUpdateProfile = false]) {
  return AppBar(
    backgroundColor: AppColors.themeColor,
    leading: GestureDetector(
      onTap: () {
        if (fromUpdateProfile) {
          return;
        }
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const UpdateProfileScreen(),
          ),
        );
      },
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: CircleAvatar(),
      ),
    ),
    title: GestureDetector(
      onTap: () {
        if (fromUpdateProfile) {
          return;
        }
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const UpdateProfileScreen(),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AuthController.userData?.fullName??'',
            style: const TextStyle(fontSize: 16, color: Colors.white),
          ),
          Text(
            AuthController.userData?.email??'',
            style: const TextStyle(
                fontSize: 11, color: Colors.white, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    ),
    actions: [
      IconButton(
        onPressed: () async {
          await AuthController.clearAllData();
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => SignInScreen(),
              ),
              (route) => false);
        },
        icon: const Icon(Icons.logout_outlined),
      ),
    ],
  );
}

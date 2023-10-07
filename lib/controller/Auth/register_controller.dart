import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies/core/class/statusrequst.dart';
import 'package:movies/core/constant/appcolor.dart';
import 'package:movies/core/constant/routes.dart';
import 'package:movies/core/function/firebase_functions/register.dart';

class RegisterController extends GetxController {
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController username;
  bool isShowPassword = false;
  StatusRequest statusRequest = StatusRequest.none;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  FireBaseUsage fireBaseUsage = FireBaseUsage();

  registerwitheEmailAndPassword() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      User? user = await fireBaseUsage.register(
          email.text, password.text, username.text);
      if (user != null) {
        await fireBaseUsage.sendEmailVerification(user);
        Get.offAllNamed(AppRoutes.otp);
      }else{
        Get.defaultDialog(
            title: "Warning",
            middleText: "Do you want exit the app",
            titleStyle:const TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColor.backgroundColor,
            ),
            onCancel: (){},
            cancelTextColor: AppColor.backgroundIconColor,
            confirmTextColor: Colors.white,
            buttonColor: AppColor.buttonColor,
            onConfirm: (){}
        );
      }
    }
    update();
  }

  goToverification() {
    Get.offAllNamed(AppRoutes.verification);
    update();
  }

  goToLogin() {
    Get.back();
    update();
  }

  @override
  void onInit() {
    username = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    email.dispose();
    password.dispose();
    super.dispose();
  }
}

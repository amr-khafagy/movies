import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies/core/class/firebase.dart';
import 'package:movies/core/class/statusrequst.dart';
import 'package:movies/core/constant/routes.dart';
import 'package:movies/core/function/dialog.dart';

class ForgetPasswordController extends GetxController {
  late TextEditingController emailVerification;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  StatusRequest statusRequest = StatusRequest.none;
  FireBaseUsage fireBaseUsage = FireBaseUsage();

  resetPassword() async {
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      User? user = await fireBaseUsage.sendPassword(emailVerification.text);
      update();
      if (user != null) {
        Get.toNamed(AppRoutes.resetPassword);
      }
    } else {
      deafultDialogGet("Error", "Check Your Email",() {}, () {});
    }
    update();
  }

  @override
  void onInit() {
    emailVerification = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    emailVerification.dispose();
    super.dispose();
  }
}

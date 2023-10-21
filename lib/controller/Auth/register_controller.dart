import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies/core/class/statusrequst.dart';
import 'package:movies/core/constant/routes.dart';
import 'package:movies/core/class/firebase.dart';
import 'package:movies/core/function/dialog.dart';

class RegisterController extends GetxController {
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController username;
  bool isShowPassword = true;
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
        Get.offAllNamed(AppRoutes.login);
      } else {
        deafultDialogGet("Error", "This account already have account",() {}, () {});
      }
    }
    update();
  }
  showpassword() {
    isShowPassword = isShowPassword == true ? false : true;
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

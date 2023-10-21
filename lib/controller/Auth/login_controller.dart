import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies/core/class/statusrequst.dart';
import 'package:movies/core/constant/routes.dart';
import 'package:movies/core/class/firebase.dart';
import 'package:movies/core/function/dialog.dart';
import 'package:movies/core/services/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  late TextEditingController emailLogin;
  late TextEditingController passwordLogin;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  StatusRequest statusRequest = StatusRequest.none;
  FireBaseUsage fireBaseUsage = FireBaseUsage();
  bool isShowPassword = true;
  Future<SharedPreferences> sharedPreferences = SharedPreferences.getInstance();
  MyServices myServices = Get.find();

  showpassword() {
    isShowPassword = isShowPassword == true ? false : true;
    update();
  }

  goToRegister() {
    Get.toNamed(AppRoutes.register);
  }

  goToForgetPassword() {
    Get.toNamed(AppRoutes.forgetPassword);
    update();
  }

  loginwithGoogle() async {
    statusRequest = StatusRequest.loading;
    update();
    User? user = await fireBaseUsage.signInWithGoogle();
    if (user != null) {
      Get.offAllNamed(AppRoutes.home);
    } else {
      deafultDialogGet("Error", "That's Error to Login With email", () {}, () {});
    }
  }

  loginwithFacebook() async {
    statusRequest = StatusRequest.loading;
    update();
    User? user = await fireBaseUsage.signInwithFacebook();
    if (user != null) {
      Get.offAllNamed(AppRoutes.home);
    } else {
      deafultDialogGet("Error", "That's Error to Login With email", () {}, () {});
    }
  }

  loginwitheEmailAndPassword() async {
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      User? user =
          await fireBaseUsage.signIn(emailLogin.text, passwordLogin.text);
      update();
      if (user != null) {
        if (user.emailVerified) {
          Get.offAllNamed(AppRoutes.home);
          myServices.sharedPreferences.setString("step", '2');
        } else {
          deafultDialogGet("Error", "Email hasn't been verified yet", () {}, () {});
        }
      } else {
        deafultDialogGet("Error", "Email Or Password is error" ,() {}, () {});
      }
    }
    update();
    return null;
  }

  @override
  void onInit() {
    emailLogin = TextEditingController();
    passwordLogin = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    emailLogin.dispose();
    passwordLogin.dispose();
    super.dispose();
  }
}

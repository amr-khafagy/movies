import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies/core/class/statusrequst.dart';
import 'package:movies/core/constant/appcolor.dart';
import 'package:movies/core/constant/routes.dart';
import 'package:movies/core/function/firebase_functions/register.dart';

class LoginController extends GetxController {
  late TextEditingController emailLogin;
  late TextEditingController passwordLogin;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  StatusRequest statusRequest = StatusRequest.none;
FireBaseUsage fireBaseUsage=FireBaseUsage();

  goToRegister() {
    Get.toNamed(AppRoutes.register);
  }
loginwithGoogle() async{
    statusRequest =StatusRequest.loading;
    update();
    User?user=await fireBaseUsage.signInWithGoogle();
    if(user!=null){
      Get.offAllNamed(AppRoutes.home);
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
  loginwithFacebook() async {
    statusRequest = StatusRequest.loading;
    update();
    User?user = await fireBaseUsage.signInwithFacebook();
    if (user != null) {
      if (user.emailVerified) {
        Get.offAllNamed(AppRoutes.home);
      } else {
        Get.defaultDialog(
            title: "Warning",
            middleText: "Do you want exit the app",
            titleStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColor.backgroundColor,
            ),
            onCancel: () {},
            cancelTextColor: AppColor.backgroundIconColor,
            confirmTextColor: Colors.white,
            buttonColor: AppColor.buttonColor,
            onConfirm: () {}
        );
      }
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
        Get.offAllNamed(AppRoutes.home);
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

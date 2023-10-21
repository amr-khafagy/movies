import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies/controller/forgetpassword/forgetpassword.dart';
import 'package:movies/core/constant/appcolor.dart';
import 'package:movies/core/function/validation.dart';
import 'package:movies/view/component/auth/login_button.dart';
import 'package:movies/view/component/auth/login_textfield.dart';
import 'package:movies/view/component/title.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordController());
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SafeArea(
          child: Form(
        child: Padding(
          padding: const EdgeInsets.only(top: 231),
          child: GetBuilder<ForgetPasswordController>(
              builder: (forgetpasswordController) {
            return Form(
              key: forgetpasswordController.formState,
              child: Center(
                child: Column(children: [
                  const AuthTitle(titleText: "Forgot Password"),
                  AuthTextField(
                    hintText: "Email",
                    textLabel: "Enter Your Email",
                    authTextEditingcontroller:
                        forgetpasswordController.emailVerification,
                    valid: (val) {
                      return validinput(val!, 5, 40, "email");
                    },
                  ),
                   AuthButton(
                    textAuth: "Send Email Verification",
                    onAuth: () {
                    forgetpasswordController.resetPassword()  ;
                    },
                  )
                ]),
              ),
            );
          }),
        ),
      )),
    );
  }
}

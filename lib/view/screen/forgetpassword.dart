import 'package:flutter/material.dart';
import 'package:movies/core/constant/appcolor.dart';
import 'package:movies/view/component/auth/login_button.dart';
import 'package:movies/view/component/auth/login_textfield.dart';
import 'package:movies/view/component/title.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 231),
            child: Center(
        child: Column(children: const[
            AuthTitle(titleText: "Forgot Password"),
            AuthTextField(hintText: "Email", textLabel: "Enter Your Email"),
            AuthButton(textAuth: "Send OTP")
        ]),
      ),
          )),
    );
  }
}

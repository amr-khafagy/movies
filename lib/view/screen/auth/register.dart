import 'package:flutter/material.dart';
import 'package:movies/core/constant/appcolor.dart';
import 'package:movies/view/component/auth/auth_subtitle.dart';
import 'package:movies/view/component/auth/login_button.dart';
import 'package:movies/view/component/auth/login_textfield.dart';
import 'package:movies/view/component/title.dart';
import 'package:movies/view/component/auth/row_button.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 200,bottom: 80),
            child: Center(
              child: Column(children: [
                const AuthTitle(titleText: "Register"),
                const AuthSubtitle(subTitle: "Create a new account"),
                const AuthTextField(hintText:"Username", textLabel:"Username"),
                const AuthTextField(hintText:"Email", textLabel:"Email"),
                const AuthTextField(hintText:"Mobile Number", textLabel:"Mobile Number"),
                const AuthTextField(hintText:"Password", textLabel:"Password"),
                const AuthButton(textAuth: "Register"),
                RowButton(rowQuetsion: "Already have account?  ",rowAction: "Login",actionOfRow:(){} ,)
              ]),
            ),
          ),
        ),
      ),
    );
  }
}

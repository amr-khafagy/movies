import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies/controller/Auth/register_controller.dart';
import 'package:movies/core/constant/appcolor.dart';
import 'package:movies/core/function/validation.dart';
import 'package:movies/view/component/auth/auth_subtitle.dart';
import 'package:movies/view/component/auth/login_button.dart';
import 'package:movies/view/component/auth/login_textfield.dart';
import 'package:movies/view/component/title.dart';
import 'package:movies/view/component/auth/row_button.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(RegisterController());
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: GetBuilder<RegisterController>(
            assignId: true,
            builder: (registerController) {
              return Form(
                key: registerController.formstate,
                child: Padding(
                  padding: const EdgeInsets.only(top: 200, bottom: 80),
                  child: Center(
                    child: Column(children: [
                      const AuthTitle(titleText: "Register"),
                      const AuthSubtitle(subTitle: "Create a new account"),
                      AuthTextField(
                        hintText: "Username",
                        textLabel: "Username",
                        authTextEditingcontroller: registerController.username,
                        valid: (val) {
                          return validinput(val!, 5, 40, "username");
                        },
                      ),
                      AuthTextField(
                        hintText: "Email",
                        textLabel: "Email",
                        authTextEditingcontroller: registerController.email,
                        valid: (val) {
                          return validinput(val!, 5, 40, "email");
                        },
                      ),
                      AuthTextField(
                        hintText: "Password",
                        textLabel: "Password",
                        authTextEditingcontroller: registerController.password,
                        valid: (val) {
                          return validinput(val!, 5, 100, "password");
                        },
                        showIcon: Icons.remove_red_eye,
                      ),
                       AuthButton(
                          textAuth: "Register",
                          onAuth: () {
                            registerController.registerwitheEmailAndPassword();
                          }),
                      RowButton(
                        rowQuetsion: "Already have account?  ",
                        rowAction: "Login",
                        actionOfRow: () {
                          registerController.goToLogin();
                        },
                      )
                    ]),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

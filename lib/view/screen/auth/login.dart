import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies/controller/Auth/login_controller.dart';
import 'package:movies/core/constant/appcolor.dart';
import 'package:movies/core/function/validation.dart';
import 'package:movies/view/component/auth/auth_forgetpassword.dart';
import 'package:movies/view/component/auth/auth_subtitle.dart';
import 'package:movies/view/component/auth/login_button.dart';
import 'package:movies/view/component/auth/login_textfield.dart';
import 'package:movies/view/component/title.dart';
import 'package:movies/view/component/auth/row_button.dart';
import 'package:movies/view/component/auth/social_login.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return Scaffold(
        backgroundColor: AppColor.backgroundColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: GetBuilder<LoginController>(builder: (loginController) {
              return Form(
                key: loginController.formState,
                child: Padding(
                    padding: const EdgeInsets.only(top: 251),
                    child: Center(
                      child: Column(children: [
                        const AuthTitle(titleText: "Welcome"),
                        const AuthSubtitle(subTitle: "Login To your Count"),
                        AuthTextField(
                          authTextEditingcontroller: loginController.emailLogin,
                          valid: (val) {
                            return validinput(val!, 5, 50, "email");
                          },
                          hintText: "Email",
                          textLabel: "Email",
                        ),
                        AuthTextField(
                          authTextEditingcontroller:
                              loginController.passwordLogin,
                          valid: (val) {
                            return validinput(val!, 5, 100, "password");
                          },
                          hintText: "Password",
                          textLabel: "Password",
                        ),
                        const ForgetPasswordText(),
                        AuthButton(
                            textAuth: "Login",
                            onAuth: () {
                              loginController.loginwitheEmailAndPassword();
                            }),
                        RowButton(
                            rowQuetsion: "Don’t have account?  ",
                            rowAction: "Create Now",
                            actionOfRow: () {
                              loginController.goToRegister();
                            }),
                        SocialLogin(
                          onGmaiilAuth: () {
                            loginController.loginwithGoogle();
                          },
                          onFacebookAuth: () {
                            loginController.loginwithFacebook();
                          },
                        )
                      ]),
                    )),
              );
            }),
          ),
        ));
  }
}

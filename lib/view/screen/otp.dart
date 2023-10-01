import 'package:flutter/material.dart';
import 'package:movies/core/constant/appcolor.dart';
import 'package:movies/view/component/auth/auth_subtitle.dart';
import 'package:movies/view/component/auth/login_button.dart';
import 'package:movies/view/component/title.dart';
import 'package:movies/view/component/auth/otptextfield.dart';

class Verification extends StatelessWidget {
  const Verification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(top: 207),
        child: Center(
          child: Column(children: const [
            AuthTitle(titleText: "Verification"),
            AuthSubtitle(
                subTitle: "Messenger has send a code to\n verify your account"),
            OTPTextField(),
            AuthButton(
              textAuth: 'Verify',
            )
          ]),
        ),
      )),
    );
  }
}

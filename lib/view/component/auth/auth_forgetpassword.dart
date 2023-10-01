import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/constant/appcolor.dart';

class ForgetPasswordText extends StatelessWidget {
  const ForgetPasswordText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 184,top: 7),
      child: InkWell(
        child: Text(
          "Forgot Password?",
          style: TextStyle(
            color: AppColor.forgetpasswordColor,
            fontSize: 16.sp,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

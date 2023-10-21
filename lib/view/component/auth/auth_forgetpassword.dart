import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/constant/appcolor.dart';

class ForgetPasswordText extends StatelessWidget {
 final void Function()? onForgetPassword;
  const ForgetPasswordText({Key? key, this.onForgetPassword}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 184,top: 7),
      child: InkWell(
        onTap:onForgetPassword ,
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

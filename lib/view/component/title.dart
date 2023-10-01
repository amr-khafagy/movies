import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/constant/appcolor.dart';

class AuthTitle extends StatelessWidget {
  final String titleText;
  const AuthTitle({Key? key, required this.titleText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Text(
      titleText,
      style: TextStyle(
          color: AppColor.headLineColor,
          fontSize: 28.sp,
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.normal),
      textAlign: TextAlign.center,
    );
  }
}

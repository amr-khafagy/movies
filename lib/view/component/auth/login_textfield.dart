import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/constant/appcolor.dart';

class AuthTextField extends StatelessWidget {
  final String hintText;
  final String textLabel;

  const AuthTextField(
      {Key? key, required this.hintText, required this.textLabel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 58, left: 30, right: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            textLabel,
            style: TextStyle(
                color: AppColor.textFieldLabelColor,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.normal,
                fontSize: 18.sp),
          ),
          const SizedBox(
            height: 6,
          ),
          TextFormField(
            decoration: InputDecoration(
                fillColor: AppColor.headLineColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                filled: true,
                hintText: hintText,
                hintStyle: TextStyle(
                    color: AppColor.hinttextColor,
                    fontSize: 16.sp,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500)),
          ),
        ],
      ),
    );
  }
}


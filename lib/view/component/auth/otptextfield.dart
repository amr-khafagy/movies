import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/constant/appcolor.dart';

class OTPTextField extends StatelessWidget {
  const OTPTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 31, left: 32, top: 23),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Email OTP",
            style: TextStyle(
                color: AppColor.textFieldLabelColor,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.normal,
                fontSize: 18.sp),
          ),
          const SizedBox(
            height: 7,
          ),
          OtpTextField(
              filled: true,
              fillColor: AppColor.headLineColor,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              numberOfFields: 5,
              fieldWidth: 50,
            borderRadius: BorderRadius.circular(6),
            showFieldAsBox: true,
          ),
        ],
      ),
    );
  }
}

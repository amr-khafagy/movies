import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/constant/appcolor.dart';

class AuthButton extends StatelessWidget {
  final String textAuth;

  const AuthButton({Key? key, required this.textAuth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 37),
      child: Container(
        decoration: BoxDecoration(
            color: AppColor.buttonColor, borderRadius: BorderRadius.circular(22)),
        width: 295,
        height: 48,
        child: MaterialButton(
          onPressed: () {},
          height: 48,
          child: Text(textAuth,
              style: TextStyle(
                color: AppColor.buttonTextdColor,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.normal,
                fontSize: 20.sp,
              ),
              textAlign: TextAlign.center),
        ),
      ),
    );
  }
}

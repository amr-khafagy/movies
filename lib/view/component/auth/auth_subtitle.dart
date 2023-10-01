import 'package:flutter/material.dart';
import 'package:movies/core/constant/appcolor.dart';

class AuthSubtitle extends StatelessWidget {
  final String subTitle;

  const AuthSubtitle({Key? key, required this.subTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      subTitle,
      style:const TextStyle(
        color: AppColor.bodytextColor,
        fontSize: 20,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
      ),
      textAlign: TextAlign.center,
    );
  }
}

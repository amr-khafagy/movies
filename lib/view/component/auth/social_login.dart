import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies/core/constant/imageassets.dart';

class SocialLogin extends StatelessWidget {
  const SocialLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 97.95,left: 98,top: 49,bottom: 80),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap:(){} ,
            child: SvgPicture.asset(
              "assets/images/Google.svg",
              width: 31.607.w,
              height: 30.h,
            ),
          ),
          InkWell(
            onTap:(){} ,
            child: Image.asset(
              "assets/images/facebook .png",
              width: 31.w,
              height: 30.h,
            ),
          ),
          InkWell(
            onTap: (){},
            child: Image.asset(
              AppImageAsset.loginInstagram,
              width: 32.w,
              height: 30.h,
            ),
          )
        ],
      ),
    );
  }
}

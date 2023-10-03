import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubTitle extends StatelessWidget {
  final String title;
  const SubTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
        title,
        style: TextStyle(
        fontWeight: FontWeight.w500,
        letterSpacing: .35.sp,
        color: const Color(0xFFFFFFFF),fontSize: 18.sp));
  }
}

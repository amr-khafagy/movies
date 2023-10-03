import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/view/component/details/subtiltle/subtitle.dart';

class DateAndGeners extends StatelessWidget {
  const DateAndGeners({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
           const SubTitle(title: "Released Data"),

          ],
        )
      ],
    );
  }
}

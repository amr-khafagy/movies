import 'package:flutter/material.dart';
import 'package:movies/core/constant/appcolor.dart';

class WatchLaterText extends StatelessWidget {
  final String watchLaterText;
  const WatchLaterText({Key? key, required this.watchLaterText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(watchLaterText, style: const TextStyle(
    fontSize: 20,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.289,
    color: AppColor.headLineColor));
  }
}

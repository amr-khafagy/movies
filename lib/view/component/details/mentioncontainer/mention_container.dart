import 'package:flutter/material.dart';
import 'package:movies/core/constant/appcolor.dart';

class MentionContainer extends StatelessWidget {
  final String mentionName;
  const MentionContainer({Key? key, required this.mentionName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Container(
        height: 27,
        width: 64,
        decoration: BoxDecoration(
            color: const Color(0x0DFAF0CA),
            borderRadius: BorderRadius.circular(16.5),
            border: Border.all(color: const Color(0x40FFFFFF))),
        child: Center(
          child: Text(
            mentionName,
            style: const TextStyle(
                fontSize: 13,
                color: AppColor.headLineColor,
                fontWeight: FontWeight.w400),
          ),
        ),
      ),
    );
  }
}

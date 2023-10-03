import 'package:flutter/material.dart';

class SubTitleDescription extends StatelessWidget {
final String subTitleDesc;
  const SubTitleDescription({Key? key, required this.subTitleDesc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Text(
        subTitleDesc,
        style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: Color(0xFFBCBCBC)),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  final String Desc;
  const Description({Key? key, required this.Desc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Text(
        Desc,
        maxLines: 5,
        style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: Color(0xFFBCBCBC)),
      ),
    );
  }
}

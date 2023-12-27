import 'package:flutter/material.dart';

class DetailsDivider extends StatelessWidget {
  const DetailsDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(right: 25,left: 25,top: 22),
      child: Divider(color:Color(0xFF515151),thickness: 2),
    );
  }
}

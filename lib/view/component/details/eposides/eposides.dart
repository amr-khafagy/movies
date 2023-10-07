import 'package:flutter/material.dart';
import 'package:movies/data/model/details.dart';

class Eposides extends StatelessWidget {
  final List<Episodes> eposides;
  const Eposides({Key? key, required this.eposides}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(eposides.toString())
      ],
    );
  }
}

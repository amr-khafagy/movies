import 'package:flutter/material.dart';
import 'package:movies/core/constant/appcolor.dart';
import 'package:movies/view/component/home/towatch/cardinfotowatch.dart';

class ImageCardInfo extends StatelessWidget {
  final String seriesName;
  const ImageCardInfo({Key? key, required this.seriesName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 254,
      height: 74,
      decoration: BoxDecoration(
          color:AppColor.infoCard,
          borderRadius: BorderRadius.circular(24.1)),
      child: CardInfo(seriesName:seriesName),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:movies/core/constant/appcolor.dart';

class TrendingCardInfo extends StatelessWidget {
  final String seriesStatus;
  final String seriesName;
  const TrendingCardInfo({Key? key, required this.seriesStatus, required this.seriesName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 92,
              height: 55,
              decoration: BoxDecoration(
                  color: AppColor.infoCard,
                  borderRadius: BorderRadius.circular(18)),
              child: Center(
                  child: Text(seriesStatus,style: const TextStyle(
                      letterSpacing: 0.385,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 20,color: AppColor.headLineColor),)),
            ),
            Container(
              width: 272,
              height: 80,
              decoration: BoxDecoration(
                  color: AppColor.infoCard,
                  borderRadius: BorderRadius.circular(24.1)),
              child: Center(
                child: Text(
                  seriesName,
                  style: const TextStyle(
                      letterSpacing: 0.385,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 20,color: AppColor.headLineColor),
                ),
              ),
            )
          ]),
    );

  }
}

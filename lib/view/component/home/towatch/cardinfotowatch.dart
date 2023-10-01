import 'package:flutter/material.dart';
import 'package:movies/core/constant/appcolor.dart';

class CardInfo extends StatelessWidget {
  final String seriesName;
  const CardInfo({Key? key, required this.seriesName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10,left: 10),
              child: CircleAvatar(
                backgroundColor: const Color(0xffFF8F71),
                child: Center(
                    child: Icon(
                      Icons.play_arrow,
                      color: Colors.white.withOpacity(.50),
                      size: 40,
                    )),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  "Show Details",
                  style: TextStyle(
                    fontSize:20,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.289,
                    color:AppColor.headLineColor,
                  ),
                ),
                Text(
                  seriesName,
                  style: const TextStyle(
                    fontSize:20,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.289,
                    color:AppColor.headLineColor,
                  ),
                ),
              ],
            ),
          ]),
    );
  }
}

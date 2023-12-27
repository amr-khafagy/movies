import 'package:flutter/material.dart';
import 'package:movies/core/constant/appcolor.dart';

class SeasonCard extends StatelessWidget {
  final int index;
  final void Function()? showEposideOfSeason;
  const SeasonCard({Key? key, required this.index, this.showEposideOfSeason}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColor.infoCard,
          borderRadius: BorderRadius.circular(20)),
      width: MediaQuery.sizeOf(context).width - 50,
      height: 100,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Season: ${(index + 1).toString()}"),
            IconButton(
                onPressed:showEposideOfSeason,
                icon: const Icon(
                    Icons.arrow_circle_down_rounded))
          ]),
    );
  }
}

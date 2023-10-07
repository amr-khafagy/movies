import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/data/model/details.dart';
import 'package:movies/view/component/details/mentioncontainer/mention_container.dart';
import 'package:movies/view/component/details/subtiltle/subtitle.dart';
import 'package:movies/view/component/details/subtiltle/subtitledescription.dart';

class DateAndGeners extends StatelessWidget {
  final String releasDate;
  final List seriesGeners;
  final int genersNumber;

  const DateAndGeners(
      {Key? key,
      required this.releasDate,
      required this.seriesGeners,
      required this.genersNumber})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 28),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Column(
              children: [
                const SubTitle(title: "Released Data"),
                SubTitleDescription(subTitleDesc: releasDate),
              ],
            ),
            SizedBox(width: 60,),
            Column(
              children: [
                const SubTitle(title: "Geners"),
                Row(
                  children: [
                    ...List.generate(
                        genersNumber,
                        (index) => MentionContainer(
                            mentionName: seriesGeners[index].toString()))
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

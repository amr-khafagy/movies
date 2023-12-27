import 'package:flutter/material.dart';
import 'package:movies/view/component/details/mentioncontainer/mention_container.dart';
import 'package:movies/view/component/details/subtiltle/subtitledescription.dart';

class TitleAndTimeAndRating extends StatelessWidget {
  final String seriesName;
  final String runningTime;
  final String rating;
  final String country;
  final String network;

  const TitleAndTimeAndRating(
      {Key? key,
      required this.seriesName,
      required this.runningTime,
      required this.rating,
      required this.country,
      required this.network})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 25, bottom: 12),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    seriesName,
                    style: const TextStyle(color: Colors.white, fontSize: 25),
                  ),
                  MentionContainer(mentionName: country),
                  MentionContainer(mentionName: network)
                ],
              ),
            ),
          ),
          Row(
            children: [
              const Icon(Icons.watch_later_outlined,
                  color: Color(0xFFBCBCBC), size: 25),
              SubTitleDescription(subTitleDesc: "$runningTime Minutes"),
              const SizedBox(
                width: 50,
              ),
              const Icon(Icons.star, color: Color(0xFFBCBCBC), size: 25),
              SubTitleDescription(subTitleDesc: "$rating IMDb")
            ],
          )
        ],
      ),
    );
  }
}

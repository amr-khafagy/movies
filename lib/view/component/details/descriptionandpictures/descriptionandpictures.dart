import 'package:flutter/material.dart';
import 'package:movies/core/constant/appcolor.dart';
import 'package:movies/view/component/details/descriptionandpictures/descriptiontext.dart';
import 'package:movies/view/component/details/descriptionandpictures/releatedpicture.dart';
import 'package:movies/view/component/details/subtiltle/subtitle.dart';
import 'package:movies/view/component/details/subtiltle/subtitledescription.dart';

class SynopsisAndPictures extends StatelessWidget {
  final String synopsis;
  final List picture;
  final bool activeReadMore;
  final bool activeWatchList;
  final void Function()? appearAndDisappear;
  final void Function()? addToWatchList;

  const SynopsisAndPictures(
      {Key? key,
      required this.synopsis,
      required this.picture,
      required this.activeReadMore,
      this.appearAndDisappear,
      this.addToWatchList,
      required this.activeWatchList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 17, bottom: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    const SubTitle(title: "Synopsis"),
                    IconButton(
                        onPressed: appearAndDisappear,
                        icon: activeReadMore == true
                            ? const Icon(
                                Icons.arrow_drop_up_sharp,
                                size: 50,
                                color: AppColor.buttonColor,
                              )
                            : const Icon(
                                Icons.arrow_drop_down_sharp,
                                size: 50,
                                color: AppColor.backgroundIconColor,
                              )),
                  ],
                ),
                IconButton(
                    onPressed: addToWatchList,
                    icon: activeWatchList == true
                        ? const Icon(
                            Icons.add_circle_outline,
                            size: 30,
                            color: AppColor.backgroundIconColor,
                          )
                        : const Icon(
                            Icons.add_circle,
                            size: 30,
                            color: AppColor.backgroundIconColor,
                          )),
              ],
            ),
          ),
          activeReadMore
              ? SubTitleDescription(subTitleDesc: synopsis)
              : Description(Desc: synopsis),
          const SizedBox(
            height: 21,
          ),
          const SubTitle(title: "Related Picture"),
          ReleatedPictures(
            picture: picture,
          )
        ],
      ),
    );
  }
}

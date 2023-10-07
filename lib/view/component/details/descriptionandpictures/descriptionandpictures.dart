import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:movies/core/constant/appcolor.dart';
import 'package:movies/view/component/details/descriptionandpictures/descriptiontext.dart';
import 'package:movies/view/component/details/descriptionandpictures/releatedpicture.dart';
import 'package:movies/view/component/details/subtiltle/subtitle.dart';
import 'package:movies/view/component/details/subtiltle/subtitledescription.dart';

class SynopsisAndPictures extends StatelessWidget {
  final String synopsis;
  final List picture;
  final  bool activeReadMore;
final void Function()? appearAndDisappear;
   SynopsisAndPictures(
      {Key? key, required this.synopsis, required this.picture, required this.activeReadMore, this.appearAndDisappear})
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
              children: [
                const SubTitle(title: "Synopsis"),
                IconButton(
                    onPressed:appearAndDisappear,
                    icon: activeReadMore==true
                        ? const Icon(
                            Icons.arrow_drop_up_sharp,
                            size: 50,
                            color: AppColor.buttonColor,
                          )
                        : const Icon(
                            Icons.arrow_drop_down_sharp,
                            size: 50,
                            color: AppColor.buttonColor,
                          ))
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

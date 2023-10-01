import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/data/model/mostpopular.dart';
import 'package:movies/view/component/home/towatch/imageinfo.dart';

class ToWatchHome extends StatelessWidget {
  final void Function()? onToWatchPressed;
  final List<TvShows> toWatchModel;

  const ToWatchHome({Key? key, required this.toWatchModel, this.onToWatchPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var random = Random();
    int randomint = random.nextInt(15);
    return InkWell(
      onTap:onToWatchPressed,
      child: Container(
        width: 394,
        height: 230,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(36.1),
            image: DecorationImage(
                image: CachedNetworkImageProvider(
                    toWatchModel[randomint].imageThumbnailPath!),
                fit: BoxFit.fill)),
        child: Padding(
            padding: const EdgeInsets.only(
                top: 145, bottom: 9, right: 125, left: 14),
            child: ImageCardInfo(
              seriesName: toWatchModel[randomint].name!,
            )),
      ),
    );
  }
}

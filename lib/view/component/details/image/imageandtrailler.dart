import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/core/constant/appcolor.dart';

class ImageAndTrailler extends StatelessWidget {
  final String seriesImage;
  final void Function()? showTrailler;
  const ImageAndTrailler(
      {Key? key,
      required this.seriesImage, this.showTrailler})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: CachedNetworkImageProvider(seriesImage),
                  fit: BoxFit.cover)),
          height: 311,
          width: 405,
          child: Center(
              child: IconButton(
                icon: const Icon(
                  color: AppColor.backgroundIconColor,
                  Icons.play_arrow,
                  size: 70,
                ),
                onPressed: showTrailler,
              )),
        ),

      ],
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/view/component/watchlist/watchlatertext.dart';

class WatchlaterTitle extends StatelessWidget {
  final String seriesName;
  final String image;
  const WatchlaterTitle({Key? key, required this.seriesName, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundImage: CachedNetworkImageProvider(image),
        ),
        WatchLaterText(watchLaterText: seriesName),
      ],
    );
  }
}

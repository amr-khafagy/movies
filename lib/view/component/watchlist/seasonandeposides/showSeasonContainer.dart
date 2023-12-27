
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies/controller/watchlist/watchlistcontroller.dart';
import 'package:movies/data/model/details.dart';
import 'package:movies/view/component/watchlist/seasonandeposides/seasonandeposides.dart';


class ShowSeasonContainer extends StatelessWidget {
  final int seriesSeason;
  final String seriesImage;
  final int eposideSeason;
  final List<Episodes> eposideName;

  const ShowSeasonContainer(
      {Key? key,
      required this.seriesSeason,
      required this.seriesImage,
      required this.eposideSeason,
      required this.eposideName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(WatchListController());
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
                image: CachedNetworkImageProvider(seriesImage),
                fit: BoxFit.fill,
                opacity: .5)),
        height: 450,
        width: MediaQuery.sizeOf(context).width - 50,
        child: SeasonAndEposides(seriesSeason: seriesSeason,eposideSeason: eposideSeason,eposideName:eposideName,seriesImage: seriesImage,));
  }
}

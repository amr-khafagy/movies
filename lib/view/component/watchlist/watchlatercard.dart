import 'package:flutter/material.dart';
import 'package:movies/core/constant/appcolor.dart';
import 'package:movies/data/model/details.dart';
import 'package:movies/view/component/watchlist/seasonandeposides/showSeasonContainer.dart';
import 'package:movies/view/component/watchlist/watchlaterbutton.dart';
import 'package:movies/view/component/watchlist/watchlatergeners.dart';
import 'package:movies/view/component/watchlist/watchlatertitle.dart';

//TODO:ListView.builder of all watch later card
class WatchLaterCard extends StatelessWidget {
  final String seriesNmae;
  final List geners;
  final String rating;
  final String image;
  final bool active;
  final void Function()? onSeriesPress;
  final void Function()? onshowSeasonPress;
  final List<Episodes> eposideNmae;
  final int seriesSeasonEposides;
  final int seriesSeason;
  final void Function()? onShowEposidPress;
  final List <bool> eposidActive;
  final void Function()? onpressDelete;

  const WatchLaterCard({Key? key,
    required this.seriesNmae,
    required this.geners,
    required this.rating,
    required this.image,
    required this.active,
    required this.eposideNmae,
    this.onSeriesPress,
    this.onShowEposidPress,
    required this.seriesSeasonEposides,
    this.onshowSeasonPress,
    required this.seriesSeason,
    required this.eposidActive, this.onpressDelete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: AppColor.infoCard,
            ),
            height: 130,
            width: MediaQuery
                .sizeOf(context)
                .width - 50,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(onTap: onSeriesPress,
                      child: WatchlaterTitle(
                          seriesName: seriesNmae, image: image)),
                  WatchLaterGeners(geners: geners),
                  WatchLaterButton(
                    onpressDelete:onpressDelete,
                    onpressShowOfSeason: onshowSeasonPress,
                  ),
                ],
              ),
            )),
        if (active)
          ShowSeasonContainer(
            eposideName: eposideNmae,
            eposideSeason: seriesSeasonEposides,
            seriesSeason: seriesSeason,
            seriesImage: image,
          )
        else
          Container()
      ],
    );
  }
}

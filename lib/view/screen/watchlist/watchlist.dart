import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies/controller/watchlist/watchlistcontroller.dart';
import 'package:movies/core/class/handlingdataview.dart';
import 'package:movies/core/constant/appcolor.dart';
import 'package:movies/core/constant/routes.dart';
import 'package:movies/view/component/watchlist/watchlatercard.dart';

class WatchList extends StatelessWidget {
  const WatchList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(WatchListController());
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: GetBuilder<WatchListController>(builder: (watchListController) {
        return HandlingDataView(
            statuesRequest: watchListController.statusRequest,
            widget: ListView.builder(
              itemBuilder: (cnotext, index) {
                final tvShowList = watchListController.listadd[index];
                return Column(children: [
                  for (var tvShow in tvShowList)
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: WatchLaterCard(
                          onpressDelete:() {
                            watchListController.deleteFromwatchList(tvShow.id!);
                          },
                          onSeriesPress: () {
                            Get.toNamed(AppRoutes.seriesDetails,
                                arguments: {"SeriesDetails": tvShow.id});
                          },
                          onshowSeasonPress: () {
                            watchListController.activeShowSeason(index);
                          },
                          onShowEposidPress: () {
                            watchListController.activeShowEposide(
                                index, tvShow.episodes!.last.season!);
                          },
                          eposidActive: watchListController.activShowEposide,
                          active: (index <
                                  watchListController.activShowSeason.length)
                              ? watchListController.activShowSeason[index]
                              : false,
                          geners: tvShow.genres!,
                          seriesNmae: tvShow.name!,
                          rating: tvShow.rating!,
                          image: tvShow.imageThumbnailPath!,
                          eposideNmae: tvShow.episodes!,
                          seriesSeason: tvShow.episodes!.last.season!,
                          seriesSeasonEposides:
                              tvShow.episodes![index].name!.length,
                        ))
                ]);
              },
              itemCount: watchListController.listWatch.length,
            ));
      }),
    );
  }
}

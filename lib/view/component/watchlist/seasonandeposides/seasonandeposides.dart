import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:movies/controller/watchlist/watchlistcontroller.dart';
import 'package:movies/data/model/details.dart';
import 'package:movies/view/component/watchlist/seasonandeposides/eposidesshown.dart';
import 'package:movies/view/component/watchlist/seasonandeposides/seasoncard.dart';

class SeasonAndEposides extends StatelessWidget {
  final int seriesSeason;
  final String seriesImage;
  final int eposideSeason;
  final List<Episodes> eposideName;

  const SeasonAndEposides(
      {Key? key, required this.seriesSeason, required this.seriesImage, required this.eposideSeason, required this.eposideName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(WatchListController());
    return ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: GetBuilder<WatchListController>(
                builder: (watchlisController) {
                  return Column(
                    children: [
                      SeasonCard(
                        index: index,
                        showEposideOfSeason: () {
                          watchlisController.activeShowEposide(
                              index, eposideName.length);
                        },
                      ),
                      if (index < watchlisController.activShowEposide.length)
                        watchlisController.activShowEposide[index]
                            ? SizedBox(
                          height: 150,
                          child: ListView.builder(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            itemBuilder: (context, indx) {
                              return Center(
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: (eposideName[indx].season ==
                                      index + 1)
                                      ? EposidesShown(
                                      eposidesnumber:
                                      eposideName[indx].episode!,
                                      eposidesname: eposideName[indx].name!)
                                      : null,
                                ),
                              );
                            },
                            itemCount: eposideName.length,
                          ),
                        )
                            : Container()
                    ],
                  );
                }),
          );
        },
        itemCount: seriesSeason);
  }}

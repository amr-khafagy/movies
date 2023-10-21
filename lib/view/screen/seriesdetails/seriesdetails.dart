import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies/controller/seriesdetails/seriesdetails.dart';
import 'package:movies/core/class/handlingdataview.dart';
import 'package:movies/core/constant/appcolor.dart';
import 'package:movies/view/component/details/dateandgeners/dateandgeners.dart';
import 'package:movies/view/component/details/descriptionandpictures/descriptionandpictures.dart';
import 'package:movies/view/component/details/divider.dart';
import 'package:movies/view/component/details/image/imageandtrailler.dart';
import 'package:movies/view/component/details/title_time_rating.dart';

class SeriesDetails extends StatelessWidget {
  const SeriesDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SeriesDetailsController());
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: GetBuilder<SeriesDetailsController>(builder: (detailsController) {
        final listDetailsData = detailsController.listDetailsData;
        return HandlingDataView(
            statuesRequest: detailsController.statusRequest,
            widget: ListView.builder(
              itemCount: listDetailsData.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ImageAndTrailler(
                      seriesImage: listDetailsData[index].imageThumbnailPath!,
                      showTrailler: listDetailsData[index].youtubeLink != null
                          ? () {
                              detailsController.launchTrailler(
                                  listDetailsData[index].youtubeLink!);
                            }
                          : () {
                              detailsController.alert();
                            },
                    ),
                    TitleAndTimeAndRating(
                        seriesName: listDetailsData[index].name!,
                        runningTime: listDetailsData[index].runtime.toString(),
                        rating: listDetailsData[index].rating.toString(),
                        country: listDetailsData[index].country!,
                        network: listDetailsData[index].network!),
                    const DetailsDivider(),
                    DateAndGeners(
                      genersNumber: listDetailsData[index].genres!.length,
                      releasDate: listDetailsData[index].startDate!,
                      seriesGeners: listDetailsData[index].genres!,
                    ),
                    const DetailsDivider(),
                    SynopsisAndPictures(
                        activeWatchList: false,
                        addToWatchList: () {
                          detailsController.addToWatchList();
                        },
                        synopsis: listDetailsData[index].description!,
                        picture: listDetailsData[index].pictures!,
                        activeReadMore: detailsController.appearvalue,
                        appearAndDisappear: () {
                          detailsController.appear();
                        }),
                  ],
                );
              },
            ));
      }),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies/controller/seriesdetails/seriesdetails.dart';
import 'package:movies/core/class/handlingdataview.dart';
import 'package:movies/core/constant/appcolor.dart';
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
                    ),
                    TitleAndTimeAndRating(
                        seriesName: listDetailsData[index].name!,
                        runningTime: listDetailsData[index].runtime.toString(),
                        rating: listDetailsData[index].rating.toString(),
                        country: listDetailsData[index].country!,
                        network: listDetailsData[index].network!),
                    const DetailsDivider(),
                  ],
                );
              },
            ));
      }),
    );
  }
}
/*
Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: CachedNetworkImageProvider(detailsController
                            .listDetailsData[1].tvShow!.imageThumbnailPath!))),
                height: 311,
                width: 405,
              );
 */

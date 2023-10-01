import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/core/constant/appcolor.dart';
import 'package:movies/data/model/mostpopular.dart';
import 'package:movies/view/component/home/trending/cardinfo.dart';

class Trending extends StatelessWidget {
  final List<TvShows> trendingModel;
  final void Function()? onTrendingSeriesPressed;


  const Trending(
      {Key? key, required this.trendingModel, this.onTrendingSeriesPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    trendingModel.shuffle();
    return Container(
        height: 300,
        color: AppColor.backgroundColor,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1),
          itemBuilder: (context, index) {
            return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap:onTrendingSeriesPressed,
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(36.1),
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: CachedNetworkImageProvider(
                              trendingModel[index].imageThumbnailPath!,
                            ),
                          )),
                      child: TrendingCardInfo(
                        seriesStatus: trendingModel[index].status!,
                        seriesName: trendingModel[index].name!,
                      )),
                ));
          },
          scrollDirection: Axis.horizontal,
          itemCount: trendingModel.length,
          shrinkWrap: true,
        ));
  }
}

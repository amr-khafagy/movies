import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/core/constant/appcolor.dart';
import 'package:movies/data/model/mostpopular.dart';

class SearchedSeries extends StatelessWidget {
  final List<TvShows> listSearchModel;
  final void Function()? onSearchedSeriesTap;
  const SearchedSeries({Key? key,  required this.listSearchModel, this.onSearchedSeriesTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount:listSearchModel.length,
          gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 20,crossAxisSpacing: 20,
              crossAxisCount: 2),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: onSearchedSeriesTap,
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          image: DecorationImage(
                              image: CachedNetworkImageProvider(
                                  listSearchModel[index]
                                      .imageThumbnailPath!),fit: BoxFit.fill)),
                      width: 200,
                    ),
                  ),
                  const SizedBox(height: 20,),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(children: [
                      Text(listSearchModel[index].name!,style: const TextStyle(color: AppColor.rowButton,),),
                      Text("(${listSearchModel[index].country!})",style: const TextStyle(color: AppColor.backgroundIconColor),),
                    ],),
                  )
                ],
              ),
            );
          }),
    );
  }
}

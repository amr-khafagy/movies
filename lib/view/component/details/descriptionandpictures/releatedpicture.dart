import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/core/constant/appcolor.dart';

class ReleatedPictures extends StatelessWidget {
final List picture;

  const ReleatedPictures({Key? key, required this.picture}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        color: AppColor.backgroundColor,
        child: GridView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: picture.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1),
            itemBuilder: (context, index) {
              return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(36.1),
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: CachedNetworkImageProvider(
                              picture[index],
                            ),
                          ))));
            }));
  }}

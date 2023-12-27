import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies/core/class/firebase.dart';
import 'package:movies/core/class/statusrequst.dart';
import 'package:movies/core/constant/appcolor.dart';
import 'package:movies/core/function/handlingdata.dart';
import 'package:movies/data/model/details.dart'; // Import your model classes
import 'package:movies/data/remote/movieslink.dart';
import 'package:url_launcher/url_launcher.dart';

class SeriesDetailsController extends GetxController {
  int? id = 1;
  List<TvShow> listDetailsData = [];
  MoviesLink moviesLink = MoviesLink(crud: Get.find());
  late StatusRequest statusRequest;
  bool appearvalue = false;
  List addTowatchList = [];
  FireBaseUsage fireBaseUsage = FireBaseUsage();

  getSeriesDetails() async {
    listDetailsData.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await moviesLink.getSeriesDetails(id!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      var listdata = response['tvShow'];
      listDetailsData.add(TvShow.fromJson(listdata));
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  appear() {
    appearvalue = !appearvalue;
    update();
    print(appearvalue);
  }

  launchTrailler(String trailler) async {
    await canLaunchUrl(Uri.parse("https://www.youtube.com/watch?v=$trailler"));
    await launchUrl(Uri.parse("https://www.youtube.com/watch?v=$trailler"));
    update();
  }

  addToWatchList() async {
    await fireBaseUsage.addTowatchList(id!);
    Get.rawSnackbar(
        titleText: const Text("Adding To Watch List",
            style: TextStyle(color: AppColor.forgetpasswordColor)),
        messageText: const Text(
          "This series added to watch list successfully",
          style: TextStyle(color: AppColor.buttonTextdColor),
        ),
        icon: const Icon(
          Icons.favorite,
          color:AppColor.backgroundIconColor,
          size: 25,
        ),
        backgroundColor: AppColor.infoCard);
  }

  alert() {
    Get.defaultDialog(
      title: "Sorry",
      middleText: "We havn't Trailler for this Series",
      titleStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        color: AppColor.backgroundColor,
      ),
      confirmTextColor: Colors.white,
      buttonColor: AppColor.backgroundIconColor,
    );
  }

  @override
  void onInit() {
    id = Get.arguments["SeriesDetails"];
    getSeriesDetails();
    super.onInit();
  }
}

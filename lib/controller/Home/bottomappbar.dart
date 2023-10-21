import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies/core/constant/appcolor.dart';
import 'package:movies/view/screen/discover/discover.dart';
import 'package:movies/view/screen/home/home.dart';
import 'package:movies/view/screen/watchlist/watchlist.dart';

class BottomAppBarHomeController extends GetxController{
int currentpage=0;
List<Widget>listPage=[
  const Home(),
const DiscoverSeries(),
  const WatchList(),
];
List<String> title=["Home","Discover","Watch Later"];
List iconBottomBar=[Icons.home_filled,Icons.search,Icons.watch_later];
onPop(){
  Get.defaultDialog(
      title: "Warning",
      middleText: "Do you want exit the app",
      titleStyle:const TextStyle(
        fontWeight: FontWeight.bold,
        color: AppColor.backgroundColor,
      ),
      onCancel: (){},
      cancelTextColor: AppColor.backgroundIconColor,
      confirmTextColor: Colors.white,
      buttonColor: AppColor.backgroundIconColor,
      onConfirm: (){
        exit(0);
      }
  );
}
changePage(int page){
currentpage = page;
update();
}
}


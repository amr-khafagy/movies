import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:movies/core/class/statusrequst.dart';
import 'package:movies/core/function/handlingdata.dart';
import 'package:movies/data/model/mostpopular.dart';
import 'package:movies/data/remote/movieslink.dart';

class DiscoverController extends GetxController {
  bool isSearch = true;
  late StatusRequest statusRequest = StatusRequest.none;
  List<TvShows> seriesList = [];
  TextEditingController? search;
  MoviesLink moviesLink = MoviesLink(crud: Get.find());
  int page = 1;
int? totalPages;

  checkSearch(val) {
    if (val == "") {
      isSearch = false;
      getSerchData(search!.text,page);
      update();
    }
  }

  onSearch() {
    isSearch = true;
    getSerchData(search!.text,page);
    update();
  }

  getSerchData(String search,int page) async {
    seriesList.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response =await moviesLink.getSearch(search, page);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      List responseData = await response["tv_shows"];
      totalPages = await response["pages"];
      seriesList.addAll(responseData.map((e) => TvShows.fromJson(e)));
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }
  increasePage() {
    if (page == totalPages) {
      page = 1;
      update();
      getSerchData(search!.text,page);
    } else {
      page++;
      update();
      getSerchData(search!.text,page);
    }
  }

  dscreasePage() {
    if (page == 1) {
      page = totalPages!;
      update();
      getSerchData(search!.text,page);
    } else {
      page--;
      update();
      getSerchData(search!.text,page);
    }
  }
  @override
  void onInit() {
    search = TextEditingController();
    getSerchData(search!.text,page);
    super.onInit();
  }
}

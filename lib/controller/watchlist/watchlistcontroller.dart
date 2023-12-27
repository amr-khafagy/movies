import 'package:get/get.dart';
import 'package:movies/core/class/firebase.dart';
import 'package:movies/core/class/statusrequst.dart';
import 'package:movies/core/function/dialog.dart';
import 'package:movies/core/function/handlingdata.dart';
import 'package:movies/data/model/details.dart';
import 'package:movies/data/remote/movieslink.dart';

class WatchListController extends GetxController {
  List<TvShow> listDetailsData = [];
  StatusRequest statusRequest = StatusRequest.none;
  MoviesLink moviesLink = MoviesLink(crud: Get.find());
  final listWatch = [];
  final List<bool> activShowEposide = [];
  final List<bool> activShowSeason = [];
  FireBaseUsage fireBaseUsage = FireBaseUsage();
  List<List<TvShow>> listadd = [];

  getSeriesDetails() async {
    List whatcList = await fireBaseUsage.getWatchList();
    listWatch.addAll(whatcList);
    update();
    List<List<TvShow>> list = [];
    for (int i = 0; i < listWatch.length; i++) {
      listDetailsData.clear();
      statusRequest = StatusRequest.loading;
      update();
      var response = await moviesLink.getSeriesDetails(listWatch[i]);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        var listdata = response['tvShow'];
        listDetailsData.add(TvShow.fromJson(listdata));
        list.add(List.from(listDetailsData));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    listadd.addAll(list);
    update();
  }

  deleteFromwatchList(int seriesID) {
    deafultDialogGet("Warning", "Are You want to delete this series", () {},
        () {
      fireBaseUsage.deletefromWatchList(seriesID);
      getSeriesDetails();
    });

    update();
  }

  activeShowSeason(int index) {
    for (int i = 0; i < listadd.length; i++) {
      activShowSeason.add(false);
    }
    activShowSeason[index] = !activShowSeason[index];
    update();
  }

  activeShowEposide(int index, int length) {
    for (int i = 0; i < length; i++) {
      activShowEposide.add(false);
    }
    activShowEposide[index] = !activShowEposide[index];
    update();
  }

  @override
  void onInit() {
    getSeriesDetails();
    super.onInit();
  }
}

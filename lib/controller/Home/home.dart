import 'package:get/get.dart';
import 'package:movies/core/class/firebase.dart';
import 'package:movies/core/class/statusrequst.dart';
import 'package:movies/core/constant/routes.dart';
import 'package:movies/core/function/handlingdata.dart';
import 'package:movies/data/model/details.dart';
import 'package:movies/data/model/mostpopular.dart';
import 'package:movies/data/remote/movieslink.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  MoviesLink moviesLink = MoviesLink(crud: Get.find());
  List<TvShows> data = [];
   StatusRequest statuesRequest=StatusRequest.none;
   FireBaseUsage fireBaseUsage=FireBaseUsage();
  int page = 1;
int totalPages=1220;

  getMostPopular(int page) async {
    data.clear();
    statuesRequest = StatusRequest.loading;
    update();
    var response = await moviesLink.getMostPopular(page);
    statuesRequest = handlingData(response);
    if (StatusRequest.success == statuesRequest) {
      List listdata = response['tv_shows'];
      data.addAll(listdata.map((e) => TvShows.fromJson(e)));
    } else {
      statuesRequest = StatusRequest.failure;
    }
    update();
  }

  increasePage() {
    if (page == totalPages) {
      page = 1;
      update();
      getMostPopular(page);
    } else {
      page++;
      update();
      getMostPopular(page);
    }
  }
gotoSeriesDetails(TvShows seriesModel){
    Get.toNamed(AppRoutes.seriesDetails,arguments: {"SeriesId":seriesModel});
}
  dscreasePage() {
    if (page == 1) {
      page = totalPages;
      update();
      getMostPopular(page);
    } else {
      page--;
      update();
      getMostPopular(page);
    }
  }

  @override
  void onInit() {
    getMostPopular(page);
    super.onInit();
  }
}

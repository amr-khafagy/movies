import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies/controller/Home/home.dart';
import 'package:movies/core/class/handlingdataview.dart';
import 'package:movies/core/constant/appcolor.dart';
import 'package:movies/data/model/mostpopular.dart';
import 'package:movies/view/component/home/towatch/to_watch_home.dart';
import 'package:movies/view/component/home/trending/changepage.dart';
import 'package:movies/view/component/home/trending/trending.dart';
import 'package:movies/view/component/title.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: GetBuilder<HomeController>(builder: (homeController) {
        return HandlingDataView(
            statuesRequest: homeController.statuesRequest,
            widget: SafeArea(
              child: SingleChildScrollView(
                child: Center(
                    child: Padding(
                  padding: const EdgeInsets.only(
                      top: 55, bottom: 55, left: 10, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AuthTitle(titleText: "To Watch"),
                      const SizedBox(
                        height: 15,
                      ),
                      ToWatchHome(toWatchModel: homeController.data),
                      const Padding(
                        padding: EdgeInsets.only(top: 53, bottom: 20),
                        child: AuthTitle(titleText: "Trending"),
                      ),
                      Trending(trendingModel: homeController.data ),
                      ChangePage(
                        increasePage: () {
                          homeController.increasePage();
                        },
                        decreasePage: () {
                          homeController.dscreasePage();
                        },
                        cureentPage: homeController.page.toString(),
                        totalPages: homeController.totalPages.toString(),
                      )
                    ],
                  ),
                )),
              ),
            ));
      }),
    );
  }
}

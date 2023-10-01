import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies/controller/discover/discover_controller.dart';
import 'package:movies/core/class/handlingdataview.dart';
import 'package:movies/core/constant/appcolor.dart';
import 'package:movies/view/component/discover/searchedseries.dart';
import 'package:movies/view/component/discover/textfield_search.dart';
import 'package:movies/view/component/home/trending/changepage.dart';
import 'package:movies/view/component/title.dart';

class DiscoverSeries extends StatelessWidget {
  const DiscoverSeries({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(DiscoverController());
    return SafeArea(
        child: Scaffold(
            backgroundColor: AppColor.backgroundColor,
            body: Padding(
              padding: const EdgeInsets.only(top: 43, left: 10, bottom: 5),
              child:
              GetBuilder<DiscoverController>(builder: (discoverController) {
                return HandlingDataView(statuesRequest: discoverController.statusRequest, widget:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AuthTitle(
                      titleText: "Find Tv Series",
                    ),
                    DiscoverSerach(
                      searchController: discoverController.search!,
                      onSearchChanged: (val) {
                        discoverController.checkSearch(val);
                      },
                      onPressedSearch: () {
                        discoverController.onSearch();
                      },
                    ),
                    if (discoverController.seriesList.isNotEmpty)
                      SearchedSeries(
                        listSearchModel: discoverController.seriesList,),
                       ChangePage(increasePage:() {discoverController.increasePage();},
                          decreasePage:() {discoverController.dscreasePage();},
                          cureentPage: discoverController.page.toString(),
                          totalPages:discoverController.totalPages.toString()),

                  ],
                ));
              }),
            )));
  }
}

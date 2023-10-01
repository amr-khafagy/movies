import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies/controller/Home/bottomappbar.dart';
import 'package:movies/view/component/home/homescreen/custombottombar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(BottomAppBarHomeController());
    return GetBuilder<BottomAppBarHomeController>(builder: (controller) {
      return Scaffold(

        bottomNavigationBar: const CustomBottomBar(),
        body: WillPopScope(
            child: controller.listPage.elementAt(controller.currentpage),
            onWillPop: () {
              controller.onPop();
              return Future.value(false);
            }),
      );
    });
  }
}

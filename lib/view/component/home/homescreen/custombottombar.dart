import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies/controller/Home/bottomappbar.dart';
import 'package:movies/core/constant/appcolor.dart';
import 'package:movies/view/component/home/homescreen/custombottomappbar.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(BottomAppBarHomeController());
    return GetBuilder<BottomAppBarHomeController>(builder: (controller) {
      return BottomAppBar(
        notchMargin: 10,
        height: 50,
        color: AppColor.backgroundColor,

        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ...List.generate(controller.listPage.length, ((index) {
              int page = index > 2 ? index - 1 : index;
              return CustomBottomAppBar(
                iconData: controller.iconBottomBar[page],
                textbutton: controller.title[page],
                active: controller.currentpage == page ? true : false,
                onpressed: () {
                  controller.changePage(page);
                },
              );
            }))
          ],
        ),
      );
    });
  }
}

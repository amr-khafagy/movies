import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:movies/core/constant/appcolor.dart';

deafultDialogGet(String title,String middletext,void Function()?oncancel,void Function()?onconfirm){
  Get.defaultDialog(
      title: title,
      middleText: middletext,
      titleStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        color: AppColor.backgroundColor,
      ),
      onCancel:oncancel,
      cancelTextColor: AppColor.backgroundIconColor,
      confirmTextColor: Colors.white,
      buttonColor: AppColor.buttonColor,
      onConfirm:onconfirm);
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies/core/constant/routes.dart';
import 'package:movies/core/services/services.dart';

class MiddleWare extends GetMiddleware{
  @override
  int? get priority=>1;
  MyServices myServices=Get.find();
  @override
  RouteSettings? redirect(String? route){
    if(myServices.sharedPreferences.getString("step")=="2"){
      return const RouteSettings(name: AppRoutes.home);
    }
    if(myServices.sharedPreferences.getString("step")=="1"){
      return const RouteSettings(name: AppRoutes.login);
    }
    return null;
  }
}
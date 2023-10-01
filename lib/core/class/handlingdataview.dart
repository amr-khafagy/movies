import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movies/core/class/statusrequst.dart';
import 'package:movies/core/constant/imageassets.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statuesRequest;
  final Widget widget;

  const HandlingDataView(
      {Key? key, required this.statuesRequest, required this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return statuesRequest == StatusRequest.loading
        ?  Center(
      child: Lottie.asset(AppImageAsset.loading,width:250,height: 250 ),
    )
        : statuesRequest == StatusRequest.offlineFailure
        ?  Center(
      child: Lottie.asset(AppImageAsset.lostConnection,width:250,height: 250),
    )
        : statuesRequest == StatusRequest.serverFailure
        ?  Center(
      child: Lottie.asset(AppImageAsset.serverFailure,width:250,height: 250),
    )
        : statuesRequest == StatusRequest.failure
        ?  Center(
      child:Lottie.asset(AppImageAsset.noData,width:250,height: 250),
    )
        : widget;
  }
}

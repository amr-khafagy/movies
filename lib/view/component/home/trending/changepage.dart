import 'package:flutter/material.dart';
import 'package:movies/core/constant/appcolor.dart';

class ChangePage extends StatelessWidget {
  final void Function()? increasePage;
  final void Function()? decreasePage;
final String cureentPage;
final String totalPages;
  const ChangePage({Key? key,required this.increasePage,required this.decreasePage, required this.cureentPage, required this.totalPages})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CircleAvatar(
          radius: 20,
        backgroundColor: AppColor.backgroundIconColor,
          child: IconButton(
              onPressed: decreasePage,
              icon: const Icon(Icons.navigate_before)),
        ),
        Text("$cureentPage/$totalPages",style: const TextStyle(color: AppColor.rowButton),),
        CircleAvatar(
          radius: 20,
          backgroundColor: AppColor.backgroundIconColor,
          child: IconButton(
              onPressed:increasePage,
              icon: const Icon(Icons.navigate_next)),
        ),
      ],
    );
  }
}

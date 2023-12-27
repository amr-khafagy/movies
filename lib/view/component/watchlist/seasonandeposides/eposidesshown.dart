import 'package:flutter/material.dart';
import 'package:movies/core/constant/appcolor.dart';
import 'package:movies/view/component/watchlist/watchlatertext.dart';

class EposidesShown extends StatelessWidget {
  final int eposidesnumber;
  final String eposidesname;
  const EposidesShown({Key? key, required this.eposidesnumber, required this.eposidesname}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment
            .spaceEvenly,
        children: [
          WatchLaterText(
              watchLaterText: "Eposide $eposidesnumber : "),
          WatchLaterText(
              watchLaterText:
              eposidesname),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.remove_red_eye,
                color: AppColor
                    .backgroundIconColor,
              ))
        ]);
  }
}

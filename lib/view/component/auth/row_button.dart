import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/constant/appcolor.dart';

class RowButton extends StatelessWidget {
  final String rowQuetsion;
  final String rowAction;
 final void Function()? actionOfRow;
  const RowButton({Key? key, this.actionOfRow, required this.rowQuetsion, required this.rowAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            rowQuetsion,
            style: TextStyle(
                color: AppColor.row,
                fontSize: 16.sp,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w500),
          ),
          InkWell(
            onTap:actionOfRow,
            child: Text(
              rowAction,
              style: TextStyle(
                  color: AppColor.rowButton,
                  fontSize: 16.sp,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}

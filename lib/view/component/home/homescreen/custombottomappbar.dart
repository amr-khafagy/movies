import 'package:flutter/material.dart';
import 'package:movies/core/constant/appcolor.dart';

class CustomBottomAppBar extends StatelessWidget {
final void Function()? onpressed;
final IconData iconData;
final String  textbutton;
final bool? active;
  const CustomBottomAppBar({Key? key, this.onpressed, required this.iconData, this.active, required this.textbutton}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(onPressed:onpressed,child: Column(
      mainAxisSize: MainAxisSize.max,
      children: [
Icon(iconData,color: active==true?AppColor.backgroundIconColor:Colors.white.withOpacity(.25),),
        Text(textbutton,style: TextStyle(color:active==true?AppColor.backgroundIconColor:Colors.white.withOpacity(.25),),)
      ],
    ),);
  }
}

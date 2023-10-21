import 'package:flutter/material.dart';

class WatchLaterButton extends StatelessWidget {
  final void Function()? onpressShowOfSeason;
  final void Function()? onpressDelete;
  const WatchLaterButton({Key? key, this.onpressShowOfSeason, this.onpressDelete}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MaterialButton(
          onPressed:onpressShowOfSeason,
          child:const Row(children: [
            Icon(Icons.arrow_drop_down),
            Text("Info Of Season"),
          ]),
        ),
        const SizedBox(width: 100,),
        IconButton(onPressed:onpressDelete, icon: const Icon(Icons.delete))
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:movies/view/component/details/mentioncontainer/mention_container.dart';

class WatchLaterGeners extends StatelessWidget {
  final List geners;
  const WatchLaterGeners({Key? key, required this.geners}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Geners:"),
        ...List.generate(
            geners.length,
                (index) => MentionContainer(
              mentionName: geners[index],
            ))
      ],
    );
  }
}

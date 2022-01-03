import 'package:flutter/material.dart';
import 'package:demoji/demoji.dart';

class AvatarPlayer extends StatelessWidget {
  const AvatarPlayer({Key key, this.player, this.size}) : super(key: key);
  final int player;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(size),
      child: Container(
        height: 50,
        width: 50,
        child: player == 1
            ? Text(
                Demoji.running_woman,
                style: TextStyle(fontSize: 30),
              )
            : Text(Demoji.running_man, style: TextStyle(fontSize: 30)),
      ),
    );
  }
}

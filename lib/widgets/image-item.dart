import 'package:flutter/material.dart';
import 'package:game_snakes_ladders/consts/snakes_ladders.dart';

class ImageItem extends StatelessWidget {
  const ImageItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: -30,
          left: 110,
          child: Image.asset(
            SnakesLaddersConst.snake,
            height: 300,
            width: 100,
          ),
        ),
        Positioned(
          bottom: 175,
          left: 190,
          child: Image.asset(
            SnakesLaddersConst.snake,
            height: 300,
            width: 100,
          ),
        ),
        Positioned(
          top: 85,
          left: 150,
          child: Image.asset(
            SnakesLaddersConst.snake_two,
            height: 300,
            width: 100,
          ),
        ),
        Positioned(
          top: 170,
          left: 20,
          child: Image.asset(
            SnakesLaddersConst.ladders,
            height: 300,
            width: 100,
          ),
        ),
        Positioned(
          top: 0,
          right: 45,
          child: RotationTransition(
            turns: AlwaysStoppedAnimation(165 / 360),
            child: Image.asset(
              SnakesLaddersConst.ladders,
              height: 300,
              width: 100,
            ),
          ),
        ),
        Positioned(
          top: -118,
          right: 160,
          child: RotationTransition(
            turns: AlwaysStoppedAnimation(270 / 360),
            child: Image.asset(
             SnakesLaddersConst.ladders,
              height: 300,
              width: 100,
            ),
          ),
        ),
      ],
    );
  }
}

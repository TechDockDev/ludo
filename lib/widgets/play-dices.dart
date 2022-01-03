import 'dart:math';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:game_snakes_ladders/consts/dices.dart';
import 'package:game_snakes_ladders/stores/snakes-ladders.dart';
import 'package:game_snakes_ladders/widgets/dice-item.dart';
import 'package:game_snakes_ladders/widgets/utils.dart';
import 'package:spring/spring.dart';

class PlayDices extends StatelessWidget {
  const PlayDices(
      {Key key, this.snakeLaddersStore, this.dicesOne, this.diceTwo})
      : super(key: key);
  final SnakesLadders snakeLaddersStore;
  final int dicesOne;
  final int diceTwo;

  @override
  Widget build(BuildContext context) {
    final random = new Random();
    if(diceTwo>0){
      if(snakeLaddersStore.currentPlayer==2){
        if (snakeLaddersStore.totalPlayerOne == 100 ||
            snakeLaddersStore.totalPlayerTwo == 100) {
          Utils.dialogFinish(context);
        } else {
          snakeLaddersStore.play(diceTwo, context);
        }
      }
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: (){
              if(snakeLaddersStore.currentPlayer==1){
                if (snakeLaddersStore.totalPlayerOne == 100 ||
                    snakeLaddersStore.totalPlayerTwo == 100) {
                  Utils.dialogFinish(context);
                } else {
                  var diceOne = 1 + random.nextInt(5);
                  snakeLaddersStore.play(diceOne, context);
                }
              }
            },
            child: DiceItem(
              dice: DicesConst.dice(
                dicesOne.toString(),
              ),
              color : snakeLaddersStore.currentPlayer==1? Colors.transparent : Colors.black54,
              springController: SpringController(initialAnim: Motion.play),
            ),
          ),
        ],
      ),
    );
  }
}

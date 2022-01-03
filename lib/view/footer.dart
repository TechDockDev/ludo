import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:game_snakes_ladders/stores/snakes-ladders.dart';
import 'package:game_snakes_ladders/widgets/play-dices.dart';

class Footer extends StatelessWidget {
  const Footer({Key key, this.snakeLaddersStore, this.diceTwo}) : super(key: key);
  final SnakesLadders snakeLaddersStore;
  final int diceTwo;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: 100,
              height: 20,
              child: Center(
                  child: Text(
                'Player 1',
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.orange[300]),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [BoxShadow(color: Colors.orange[100])]),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 70.0),
              child: Container(
                width: 100,
                height: 20,
                child: Center(
                    child: Text(
                  'Player 2',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.orange[300]),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [BoxShadow(color: Colors.orange[100])]),
              ),
            ),
          ],
        ),
        Observer(
          name: 'PlayDices',
          builder: (BuildContext context) {
            return PlayDices(
              snakeLaddersStore: snakeLaddersStore,
              dicesOne: snakeLaddersStore.currentDiceOne,
              diceTwo : diceTwo
            );
          },
        ),
      ],
    );
  }
}

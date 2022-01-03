
import 'package:firebase_database/firebase_database.dart';
import 'package:game_snakes_ladders/consts/snakes_ladders.dart';
import 'package:game_snakes_ladders/widgets/utils.dart';
import 'package:mobx/mobx.dart';

import '../model.dart';
part 'snakes-ladders.g.dart';

class SnakesLadders = _SnakesLaddersBase with _$SnakesLadders;

class _SnakesLaddersBase with Store {
  Utils utils = new Utils();

  @observable
  int _currentPlayer = 1;

  @observable
  int _currentDiceOne = 1;


  @observable
  int _totalPlayerTwo = 1;

  @observable
  int _totalPlayerOne = 1;

  @computed
  int get totalPlayerOne => _totalPlayerOne;

  @computed
  int get totalPlayerTwo => _totalPlayerTwo;

  @computed
  int get currentPlayer => _currentPlayer;

  @computed
  int get currentDiceOne => _currentDiceOne;


  @action
  init(){
    FirebaseDatabase.instance.reference().child('gameData').onValue.listen((event) {
      if(event.snapshot.exists){
        _currentDiceOne = event.snapshot.value["currentDiceOne"];
        _totalPlayerOne = event.snapshot.value["totalPlayerOne"];
        _currentPlayer = event.snapshot.value["currentPlayer"];
        _totalPlayerTwo = event.snapshot.value["totalPlayerTwo"];
      }
    });
  }

  @action
  play(diceOne, context) {
    _currentDiceOne = diceOne;

    if (_currentPlayer == 1) {
      var total = _totalPlayerOne + diceOne ;
      if (total > 100) utils.dialogRulesWin(context, _currentPlayer, total);
      _totalPlayerOne = total > 100 ? _totalPlayerOne : total;

      var element = SnakesLaddersConst.snakesLadders
          .where((element) => element['position'] == _totalPlayerOne);
      if (element.isNotEmpty) utils.dialogRules(context, element, _currentPlayer);
    }

    if (_currentPlayer == 2) {
      var total = _totalPlayerTwo + diceOne ;
      if (total > 100) utils.dialogRulesWin(context, _currentPlayer, total);
      _totalPlayerTwo = total > 100 ? _totalPlayerTwo : total;
      var element = SnakesLaddersConst.snakesLadders
          .where((element) => element['position'] == _totalPlayerTwo);
      if (element.isNotEmpty) utils.dialogRules(context, element, _currentPlayer);
    }

    if (_totalPlayerTwo == 100 || _totalPlayerOne == 100)
      Utils.dialogWin(context, _currentPlayer);
    _currentPlayer = _currentPlayer == 1 ? 2 : 1;

    FirebaseDatabase.instance.reference().child('gameData').set(GameData(
      currentDiceOne: currentDiceOne,
      currentPlayer: currentPlayer,
      totalPlayerOne: totalPlayerOne,
      totalPlayerTwo: totalPlayerTwo
    ).toJson());

  }

  @action
  restartPlayers() {
    _totalPlayerOne = 1;
    _totalPlayerTwo = 1;
  }

  @action
  setPlayers(player, value) {
    player == 1 ? _totalPlayerOne = value : _totalPlayerTwo = value;
  }
}

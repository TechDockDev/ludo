class GameData{
  int currentPlayer;
  int currentDiceOne;
  int totalPlayerTwo;
  int totalPlayerOne;

  GameData(
      {this.currentPlayer,
        this.currentDiceOne,
        this.totalPlayerTwo,
        this.totalPlayerOne});

  GameData.fromJson(Map<String, dynamic> json) {
    currentPlayer = json['currentPlayer'];
    currentDiceOne = json['currentDiceOne'];
    totalPlayerTwo = json['totalPlayerTwo'];
    totalPlayerOne = json['totalPlayerOne'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['currentPlayer'] = this.currentPlayer;
    data['currentDiceOne'] = this.currentDiceOne;
    data['totalPlayerTwo'] = this.totalPlayerTwo;
    data['totalPlayerOne'] = this.totalPlayerOne;
    return data;
  }
}
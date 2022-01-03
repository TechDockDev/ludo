import 'package:demoji/demoji.dart';

class SnakesLaddersConst {
  static String snake = 'assets/snake.png';
  static String snake_two = 'assets/snake_two.png';
  static String ladders = 'assets/ladder.png';

  static List snakesLadders = [
    {
      'position': 40,
      'positionFuture': 24,
      'title': 'Ops... ' + Demoji.snake,
      'message': 'You will have to go back to the 24th house, you have fallen into a house where the snake\'s head is located.'
    },
    {
      'position': 60,
      'positionFuture': 42,
      'title': 'Que azar... '+ Demoji.snake,
      'message': 'You will have to go back to the 42th house, you have fallen into a house where the snake\'s head is located.'
    },
    {
      'position': 87,
      'positionFuture': 71,
      'title': 'Bahhh... '+ Demoji.snake,
      'message': 'You will have to go back to the 71th house, you have fallen into a house where the snake\'s head is located.'
    },
    {
      'position': 18,
      'positionFuture': 45,
      'title': 'Que sorte... '+ Demoji.fire,
      'message': 'You will go to house 45, you have fallen into a house where the base of the stairs is located.'
    },
    {
      'position': 95,
      'positionFuture': 98,
      'title': 'Boa... '+ Demoji.four_leaf_clover,
      'message': 'You will go to house 98, you have fallen into a house where the base of the stairs is located.'
    },
    {
      'position': 57,
      'positionFuture': 76,
      'title': 'É teu dia... ' + Demoji.star2,
      'message': 'You will go to house 76, you have fallen into a house where the base of the stairs is located.'
    }
  ];
}

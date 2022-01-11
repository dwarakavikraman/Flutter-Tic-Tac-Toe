import 'package:flutter/material.dart';
import 'package:tic_tac_toe/pages/game.dart';

class ScoreBoard extends StatelessWidget {
  const ScoreBoard({
    Key? key,
    required this.scoreX,
    required this.scoreO,
    required this.playerX,
    required this.playerO,
  }) : super(key: key);

  final int scoreX;
  final int scoreO;
  final PlayerType playerX;
  final PlayerType playerO;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Player X', style: Theme.of(context).textTheme.headline5),
              Text(
                '(${playerX == PlayerType.human ? 'Player1' : 'Computer'})',
                style: Theme.of(context).textTheme.subtitle2,
              ),
              const SizedBox(height: 10),
              Text(
                scoreX.toString(),
                style: Theme.of(context).textTheme.headline5,
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Player O', style: Theme.of(context).textTheme.headline5),
              Text(
                '(${playerO == PlayerType.human ? 'Player1' : 'Computer'})',
                style: Theme.of(context).textTheme.subtitle2,
              ),
              const SizedBox(height: 10),
              Text(
                scoreO.toString(),
                style: Theme.of(context).textTheme.headline5,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

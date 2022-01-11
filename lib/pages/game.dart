import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tic_tac_toe/components/o.dart';
import 'package:tic_tac_toe/components/score_board.dart';
import 'package:tic_tac_toe/components/x.dart';
import 'package:tic_tac_toe/constants/board_theme.dart';
import 'package:tic_tac_toe/services/game_helper.dart';

enum PlayerType { human, computer }
enum GameDifficulty { easy, hard }
enum GameState { done, inProgress }

class GamePage extends StatefulWidget {
  GamePage({
    Key? key,
    required this.playerX,
    required this.playerO,
    required this.difficulty,
  }) : super(key: key);

  PlayerType playerX = PlayerType.human;
  PlayerType playerO = PlayerType.computer;
  GameDifficulty difficulty = GameDifficulty.hard;

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  int scoreX = 0;
  int scoreO = 0;
  int totalMoves = 0;
  bool isXTurn = true;
  GameState gameState = GameState.inProgress;
  List<String> board = List<String>.generate(9, (index) => '');

  @override
  void initState() {
    if (widget.playerX == PlayerType.computer) {
      computerMove();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: gameState == GameState.done ? resetGame : null,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: const Text('Game'),
          actions: [
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: resetGame,
            ),
            IconButton(
              icon: const Icon(Icons.info),
              onPressed: () => showHelpDialog(context),
            ),
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Flexible(
              flex: 2,
              child: ScoreBoard(
                scoreX: scoreX,
                scoreO: scoreO,
                playerX: widget.playerX,
                playerO: widget.playerO,
              ),
            ),
            Flexible(
              flex: 5,
              child: _buildGrid(),
            ),
            Flexible(
              flex: 1,
              child: _buildGameState(),
            ),
          ],
        ),
      ),
    );
  }

  void showHelpDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Tic Tac Toe'),
        content: const Text('This is a simple game of tic tac toe.\n\n'
            'The game is played on a 3x3 grid.\n\n'
            'The first player to get three in a row wins.'),
        actions: [
          TextButton(
            child: const Text('OK'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }

  Widget _buildGrid() {
    return Container(
      margin: const EdgeInsets.all(32),
      child: GridView.count(
        crossAxisCount: 3,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(9, (index) {
          return _buildGridItem(index);
        }),
      ),
    );
  }

  Widget _buildGridItem(int index) {
    return GestureDetector(
      key: Key('grid-item-$index'),
      onTap: gameState == GameState.inProgress
          ? () {
              if (board[index] == '') {
                if (isXTurn && widget.playerX == PlayerType.human) {
                  makeMove(index);
                } else if (!isXTurn && widget.playerO == PlayerType.human) {
                  makeMove(index);
                }
              }
            }
          : null,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: XOBoardTheme.borders[index],
        ),
        child: board[index] == 'X'
            ? const X()
            : board[index] == 'O'
                ? const O()
                : null,
      ),
    );
  }

  Widget _buildGameState() {
    String message = '';
    if (gameState == GameState.done) {
      String? winner = Helper.checkWinner(board);
      if (winner == 'X') {
        message = 'X Wins!';
        scoreX++;
      } else if (winner == 'O') {
        message = 'O Wins!';
        scoreO++;
      } else {
        message = 'Draw!';
      }
    }
    return Text(
      message,
      key: const Key('game-state'),
      style: Theme.of(context).textTheme.headline6,
    );
  }

  getCurrentPlayer() {
    return isXTurn ? 'X' : 'O';
  }

  getOppositePlayer() {
    return isXTurn ? 'O' : 'X';
  }

  vibrateLongDuration() async {
    HapticFeedback.vibrate();
    await Future.delayed(const Duration(milliseconds: 100));
    HapticFeedback.vibrate();
    await Future.delayed(const Duration(milliseconds: 100));
    HapticFeedback.vibrate();
  }

  makeMove(int index) async {
    setState(() {
      board[index] = isXTurn ? 'X' : 'O';
      isXTurn = !isXTurn;
      totalMoves++;
    });
    HapticFeedback.selectionClick();

    if (isGameOver()) {
      vibrateLongDuration();
      setState(() {
        gameState = GameState.done;
      });
    } else if ((isXTurn && widget.playerX == PlayerType.computer) ||
        (!isXTurn && widget.playerO == PlayerType.computer)) {
      await Future.delayed(Duration(milliseconds: 250));
      computerMove();
    }
  }

  bool isGameOver() {
    String? winner = Helper.checkWinner(board);
    if (winner != null) {
      return true;
    }
    return false;
  }

  void resetGame() {
    HapticFeedback.vibrate();
    setState(() {
      gameState = GameState.inProgress;
      board = List<String>.generate(9, (index) => '');
      totalMoves = 0;
      isXTurn = true;
      if (widget.playerX == PlayerType.computer) {
        computerMove();
      }
    });
    HapticFeedback.vibrate();
  }

  void computerMove() {
    int move;
    if (widget.difficulty == GameDifficulty.easy) {
      move = Helper.easyMove(board);
    } else {
      move = Helper.bestMove(
        List<String>.from(board),
        getCurrentPlayer(),
        getOppositePlayer(),
      );
    }
    makeMove(move);
  }
}

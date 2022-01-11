import 'dart:math';

class Helper {
  static int easyMove(List<String> currentBoard) {
    int move = -1;
    List<int> emptySpots = [];
    for (int i = 0; i < 9; i++) {
      if (currentBoard[i] == "") {
        emptySpots.add(i);
      }
    }
    if (emptySpots.isEmpty) {
      return -1;
    }
    Random rand = Random();
    int randomIndex = rand.nextInt(emptySpots.length);
    move = emptySpots[randomIndex];
    return move;
  }

  static int bestMove(
      List<String> currentBoard, String player, String opponent) {
    int bestScore = -10000;
    int move = -1;
    for (int i = 0; i < 9; i++) {
      if (currentBoard[i] == '') {
        currentBoard[i] = player;
        int score = minimax(currentBoard, false, player, opponent);
        currentBoard[i] = '';
        if (score > bestScore) {
          bestScore = score;
          move = i;
        }
      }
    }
    return move;
  }

  static int minimax(List<String> currentBoard, bool isMaximise, String player,
      String opponent) {
    String? result = checkWinner(currentBoard);
    if (result != null) {
      return result == player
          ? 10
          : result == opponent
              ? -10
              : 0;
    }
    if (isMaximise) {
      int bestScore = -10000;
      for (int i = 0; i < 9; i++) {
        if (currentBoard[i] == '') {
          currentBoard[i] = player;
          int score = minimax(currentBoard, false, player, opponent);
          currentBoard[i] = '';
          bestScore = max(score, bestScore);
        }
      }
      return bestScore;
    } else {
      int bestScore = 10000;
      for (int i = 0; i < 9; i++) {
        if (currentBoard[i] == '') {
          currentBoard[i] = opponent;
          int score = minimax(currentBoard, true, player, opponent);
          currentBoard[i] = '';
          bestScore = min(score, bestScore);
        }
      }
      return bestScore;
    }
  }

  static String? checkWinner(List<String> currentBoard) {
    // check first row
    if (currentBoard[0] == currentBoard[1] &&
        currentBoard[0] == currentBoard[2] &&
        currentBoard[0] != '') {
      return currentBoard[0];
    }

    // check second row
    if (currentBoard[3] == currentBoard[4] &&
        currentBoard[3] == currentBoard[5] &&
        currentBoard[3] != '') {
      return currentBoard[3];
    }

    // check third row
    if (currentBoard[6] == currentBoard[7] &&
        currentBoard[6] == currentBoard[8] &&
        currentBoard[6] != '') {
      return currentBoard[6];
    }

    // check first column
    if (currentBoard[0] == currentBoard[3] &&
        currentBoard[0] == currentBoard[6] &&
        currentBoard[0] != '') {
      return currentBoard[0];
    }

    // check second column
    if (currentBoard[1] == currentBoard[4] &&
        currentBoard[1] == currentBoard[7] &&
        currentBoard[1] != '') {
      return currentBoard[1];
    }

    // check third column
    if (currentBoard[2] == currentBoard[5] &&
        currentBoard[2] == currentBoard[8] &&
        currentBoard[2] != '') {
      return currentBoard[2];
    }

    // check diagonal
    if (currentBoard[0] == currentBoard[4] &&
        currentBoard[0] == currentBoard[8] &&
        currentBoard[0] != '') {
      return currentBoard[0];
    }

    // check diagonal
    if (currentBoard[2] == currentBoard[4] &&
        currentBoard[2] == currentBoard[6] &&
        currentBoard[2] != '') {
      return currentBoard[2];
    }

    int openSpots = 0;
    for (int i = 0; i < 9; i++) {
      if (currentBoard[i] == '') {
        openSpots++;
      }
    }

    if (openSpots == 0) {
      return 'tie';
    }

    return null;
  }
}

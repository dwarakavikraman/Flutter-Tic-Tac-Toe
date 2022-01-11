import 'package:flutter_test/flutter_test.dart';
import 'package:tic_tac_toe/services/game_helper.dart';

void main() {
  test('Winner in First Row', () {
    var winner = Helper.checkWinner(['X', 'X', 'X', 'O', 'O', '', '', '', '']);

    expect(winner, 'X');
  });

  test('Winner in Second Row', () {
    var winner = Helper.checkWinner(['O', 'O', '', 'X', 'X', 'X', '', '', '']);

    expect(winner, 'X');
  });

  test('Winner in Third Row', () {
    var winner = Helper.checkWinner(['', '', '', 'O', 'O', '', 'X', 'X', 'X']);

    expect(winner, 'X');
  });

  test('Winner in First Column', () {
    var winner = Helper.checkWinner(['X', 'O', '', 'X', 'O', '', 'X', '', '']);

    expect(winner, 'X');
  });

  test('Winner in Second Column', () {
    var winner = Helper.checkWinner(['X', 'O', '', 'X', 'O', 'X', '', 'O', '']);

    expect(winner, 'O');
  });

  test('Winner in Third Column', () {
    var winner = Helper.checkWinner(['', 'O', 'X', '', 'O', 'X', '', '', 'X']);

    expect(winner, 'X');
  });

  test('Winner in First Diagonal', () {
    var winner = Helper.checkWinner(['X', 'O', 'O', '', 'X', '', '', '', 'X']);

    expect(winner, 'X');
  });

  test('Winner in Second Diagonal', () {
    var winner = Helper.checkWinner(['', '', 'X', 'O', 'X', 'O', 'X', '', '']);

    expect(winner, 'X');
  });

  test('Check Draw Game', () {
    var winner =
        Helper.checkWinner(['X', 'O', 'X', 'O', 'O', 'X', 'X', 'X', 'O']);

    expect(winner, 'tie');
  });

  test('Check for game in progress', () {
    var winner = Helper.checkWinner(['X', 'O', 'X', 'O', 'O', '', '', 'X', '']);

    expect(winner, null);
  });
}

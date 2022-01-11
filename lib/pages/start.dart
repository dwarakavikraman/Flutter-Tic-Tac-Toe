import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tic_tac_toe/pages/choose.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.info),
            onPressed: () => showHelpDialog(context),
          ),
        ],
      ),
      body: Column(
        children: [
          const Expanded(
            child: Center(
              child: Text(
                'XO',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 140,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'PermanentMarker',
                ),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: ElevatedButton(
                onPressed: () => goToNextPage(context),
                child: const Text('Start Game'),
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                    const EdgeInsets.fromLTRB(32, 8, 32, 8),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  showHelpDialog(BuildContext context) {
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

  void goToNextPage(BuildContext context) {
    HapticFeedback.heavyImpact();
    Navigator.of(context).push(
      CupertinoPageRoute(
        builder: (context) => const ChooserPage(),
      ),
    );
  }
}

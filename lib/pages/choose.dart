import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tic_tac_toe/components/o.dart';
import 'package:tic_tac_toe/components/selectable_card.dart';
import 'package:tic_tac_toe/components/x.dart';
import 'package:tic_tac_toe/pages/game.dart';

class ChooserPage extends StatefulWidget {
  const ChooserPage({Key? key}) : super(key: key);

  @override
  State<ChooserPage> createState() => _ChooserPageState();
}

class _ChooserPageState extends State<ChooserPage> {
  bool isXSelected = true;
  void setSide(value) {
    HapticFeedback.selectionClick();
    setState(() {
      isXSelected = value;
    });
  }

  bool isEasyMode = false;
  void setMode(value) {
    HapticFeedback.selectionClick();
    setState(() {
      isEasyMode = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Choose Your Preference'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              const Text(
                'Choose your side',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 16),
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 16,
                mainAxisSpacing: 42,
                padding: const EdgeInsets.all(10),
                children: [
                  SelectableCard(
                    child: const X(),
                    onTap: () => setSide(true),
                    isSelected: isXSelected,
                  ),
                  SelectableCard(
                    child: const O(),
                    onTap: () => setSide(false),
                    isSelected: !isXSelected,
                  ),
                ],
              ),
            ],
          ),
          Column(
            children: [
              const Text(
                'Choose the difficulty',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 16),
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 16,
                mainAxisSpacing: 42,
                padding: const EdgeInsets.all(10),
                children: [
                  SelectableCard(
                    child: const Text(
                      'Easy',
                      style: TextStyle(fontSize: 20),
                    ),
                    onTap: () => setMode(true),
                    isSelected: isEasyMode,
                  ),
                  SelectableCard(
                    child: const Text(
                      'Hard',
                      style: TextStyle(fontSize: 20),
                    ),
                    onTap: () => setMode(false),
                    isSelected: !isEasyMode,
                  ),
                ],
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () => goToNextPage(context),
            child: const Text('Continue'),
            style: ButtonStyle(
              padding: MaterialStateProperty.all(
                const EdgeInsets.fromLTRB(32, 8, 32, 8),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void goToNextPage(BuildContext context) {
    HapticFeedback.vibrate();
    Navigator.of(context).pushReplacement(CupertinoPageRoute(
      builder: (context) => GamePage(
        playerX: isXSelected ? PlayerType.human : PlayerType.computer,
        playerO: !isXSelected ? PlayerType.human : PlayerType.computer,
        difficulty: isEasyMode ? GameDifficulty.easy : GameDifficulty.hard,
      ),
    ));
  }
}

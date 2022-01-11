// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tic_tac_toe/constants/theme.dart';

import 'package:tic_tac_toe/pages/game.dart';

void main() {
  final TestWidgetsFlutterBinding binding =
      TestWidgetsFlutterBinding.ensureInitialized()
          as TestWidgetsFlutterBinding;

  testWidgets('Manual Testing For O Wins', (WidgetTester tester) async {
    binding.window.physicalSizeTestValue = Size(400, 800);
    binding.window.devicePixelRatioTestValue = 1.0;
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(
      theme: MyTheme.theme,
      home: GamePage(
          playerX: PlayerType.human,
          playerO: PlayerType.human,
          difficulty: GameDifficulty.hard),
    ));

    expect(find.text(''), findsOneWidget);

    expect(find.text('0'), findsNWidgets(2));
    expect(find.text('1'), findsNothing);

    await tester.tap(find.byKey(const Key('grid-item-0')));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('grid-item-4')));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('grid-item-1')));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('grid-item-2')));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('grid-item-3')));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('grid-item-6')));
    await tester.pumpAndSettle();

    expect(find.text('O Wins!'), findsOneWidget);

    await tester.tap(find.byKey(const Key('grid-item-6')));
    await tester.pumpAndSettle();

    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsOneWidget);
  });

  testWidgets('Manual Test for Draw', (WidgetTester tester) async {
    binding.window.physicalSizeTestValue = Size(400, 800);
    binding.window.devicePixelRatioTestValue = 1.0;
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(
      theme: MyTheme.theme,
      home: GamePage(
          playerX: PlayerType.human,
          playerO: PlayerType.human,
          difficulty: GameDifficulty.hard),
    ));

    expect(find.text(''), findsOneWidget);

    expect(find.text('0'), findsNWidgets(2));
    expect(find.text('1'), findsNothing);

    await tester.tap(find.byKey(const Key('grid-item-0')));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('grid-item-4')));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('grid-item-8')));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('grid-item-1')));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('grid-item-7')));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('grid-item-6')));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('grid-item-2')));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('grid-item-5')));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('grid-item-3')));
    await tester.pumpAndSettle();

    expect(find.text('Draw!'), findsOneWidget);

    await tester.tap(find.byKey(const Key('grid-item-6')));
    await tester.pumpAndSettle();

    expect(find.text('0'), findsNWidgets(2));
    expect(find.text('1'), findsNothing);
  });
}

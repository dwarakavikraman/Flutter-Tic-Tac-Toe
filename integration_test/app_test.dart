import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:tic_tac_toe/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('Whole App', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      expect(find.text('XO'), findsOneWidget);
      expect(find.text('Start Game'), findsOneWidget);

      await tester.tap(find.text('Start Game'));
      await tester.pumpAndSettle();

      expect(find.text('Choose your side'), findsOneWidget);
      expect(find.text('X'), findsOneWidget);
      expect(find.text('O'), findsOneWidget);

      await tester.tap(find.text('O'));
      await tester.pumpAndSettle();

      expect(find.text('Continue'), findsOneWidget);

      await tester.tap(find.text('Continue'));
      await tester.pumpAndSettle();

      expect(find.text('X'), findsOneWidget);
      expect(find.text('O'), findsNothing);
      expect(find.text('0'), findsNWidgets(2));
      expect(find.text('1'), findsNothing);

      await tester.tap(find.byKey(const Key('grid-item-2')));
      await tester.pumpAndSettle();

      expect(find.text('X'), findsNWidgets(2));
      expect(find.text('O'), findsNWidgets(1));

      await tester.tap(find.byIcon(Icons.refresh));
      await tester.pumpAndSettle();

      expect(find.text('X'), findsOneWidget);
      expect(find.text('O'), findsNothing);

      await tester.pageBack();
      await tester.pumpAndSettle();
    });
  });
}

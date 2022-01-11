import 'package:flutter/material.dart';
import 'package:tic_tac_toe/constants/theme.dart';
import 'package:tic_tac_toe/pages/start.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: MyTheme.theme,
      home: const StartPage(),
    );
  }
}

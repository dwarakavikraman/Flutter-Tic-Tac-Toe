import 'package:flutter/material.dart';
import 'package:tic_tac_toe/constants/theme.dart';

class X extends StatelessWidget {
  const X({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'X',
      style: TextStyle(
        color: MyColors.carolineBlue,
        fontSize: 40,
        fontFamily: 'PermanentMarker',
      ),
    );
  }
}

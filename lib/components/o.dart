import 'package:flutter/material.dart';
import 'package:tic_tac_toe/constants/theme.dart';

class O extends StatelessWidget {
  const O({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'O',
      style: TextStyle(
        color: MyColors.lightOrange,
        fontSize: 40,
        fontFamily: 'PermanentMarker',
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:tic_tac_toe/constants/theme.dart';

class XOBoardTheme {
  static Color borderColor = MyColors.darkBlueVariant;
  static double width = 4;

  static List<BoxBorder> borders = [
    Border(
      right: BorderSide(color: borderColor, width: width),
      bottom: BorderSide(color: borderColor, width: width),
    ),
    Border(
      right: BorderSide(color: borderColor, width: width),
      bottom: BorderSide(color: borderColor, width: width),
    ),
    Border(
      bottom: BorderSide(color: borderColor, width: width),
    ),
    Border(
      right: BorderSide(color: borderColor, width: width),
      bottom: BorderSide(color: borderColor, width: width),
    ),
    Border(
      right: BorderSide(color: borderColor, width: width),
      bottom: BorderSide(color: borderColor, width: width),
    ),
    Border(
      bottom: BorderSide(color: borderColor, width: width),
    ),
    Border(
      right: BorderSide(color: borderColor, width: width),
    ),
    Border(
      right: BorderSide(color: borderColor, width: width),
    ),
    const Border(),
  ];
}

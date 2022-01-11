import 'package:flutter/material.dart';

class MyColors {
  static Color darkOrange = const Color(0xFFD8635A);
  static Color shadedWhite = const Color(0xFFFCFFEB);
  static Color darkBlue = const Color(0xFF151E3F);
  static Color carolineBlue = const Color(0xFF4D9DE0);
  static Color lightOrange = const Color(0xFFFFA987);
  static Color seaGreen = const Color(0xFF3BB273);
  static Color darkBlueVariant = const Color(0xFF1C2E54);
  static Color darkerRed = const Color(0xFF8B1E3F);
}

class MyTheme {
  static ThemeData theme = ThemeData.dark().copyWith(
    primaryColor: MyColors.seaGreen,
    colorScheme: const ColorScheme.dark().copyWith(
      primary: MyColors.darkerRed,
      secondary: MyColors.seaGreen,
      surface: MyColors.darkBlue,
      background: MyColors.darkBlue,
      error: MyColors.darkOrange,
      onPrimary: MyColors.shadedWhite,
      onSecondary: MyColors.shadedWhite,
      onSurface: MyColors.shadedWhite,
      onBackground: MyColors.shadedWhite,
      onError: MyColors.shadedWhite,
      brightness: Brightness.dark,
    ),
    backgroundColor: MyColors.darkBlue,
    appBarTheme: AppBarTheme(
      color: MyColors.darkBlue,
      elevation: 0,
    ),
    scaffoldBackgroundColor: MyColors.darkBlue,
    textTheme: TextTheme(
      headline6: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: MyColors.seaGreen,
      ),
      headline5: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: MyColors.seaGreen,
      ),
      subtitle2: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: MyColors.seaGreen,
      ),
    ),
    dialogTheme: DialogTheme(
      backgroundColor: MyColors.darkBlue,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: MyColors.shadedWhite,
      ),
      contentTextStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: MyColors.shadedWhite,
      ),
    ),
  );
}

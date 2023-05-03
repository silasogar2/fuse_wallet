import 'package:flutter/material.dart';

import './app_theme.dart';
import '../constants/color_constants.dart';

class DifferentColorsTheme extends AppTheme {
  ThemeData lightTheme() {
    return ThemeData(
      appBarTheme: const AppBarTheme(color: Colors.white), //rgba()
      brightness: Brightness.light,
      primaryColor: primaryColor,
      bottomAppBarTheme:
          const BottomAppBarTheme(color: Color.fromRGBO(20, 20, 20, 1)),
      cardColor: whiteColor,
      highlightColor: grayColor,
      fontFamily: 'Montserrat',
      cardTheme: const CardTheme(
        color: whiteColor,
      ),
      buttonTheme: const ButtonThemeData(
        buttonColor: primaryColor,
        textTheme: ButtonTextTheme.normal,
      ),
      inputDecorationTheme: inputDecorationTheme(),
      dividerTheme:
          const DividerThemeData(color: Color.fromRGBO(20, 20, 28, 1)),
      unselectedWidgetColor: grayColor,
      textTheme: lightTextTheme(),
      scaffoldBackgroundColor: scaffoldBackgroundColor,
    );
  }
}

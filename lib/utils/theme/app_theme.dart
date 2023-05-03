import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:google_fonts/google_fonts.dart";

import "../constants/color_constants.dart";
import "different_color_theme.dart";

abstract class AppTheme {
  static ThemeMode get themeMode {
    return ThemeMode.light;
  }

  TextStyle get title1 => GoogleFonts.getFont(
        'Montserrat',
        fontWeight: FontWeight.w500,
        fontSize: 30,
      );

  TextStyle get bodyText1 => GoogleFonts.getFont(
        'Montserrat',
        fontWeight: FontWeight.normal,
        fontSize: 14,
      );

  static AppTheme of(BuildContext context) => DifferentColorsTheme();

  AppBarTheme appBarTheme() {
    return const AppBarTheme(
      color: primaryColor,
      elevation: 0,
      iconTheme: IconThemeData(color: primaryColor),
      systemOverlayStyle: SystemUiOverlayStyle.dark,
    );
  }

  InputDecorationTheme inputDecorationTheme() {
    OutlineInputBorder outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: darkColor),
      gapPadding: 10,
    );

    return InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      border: outlineInputBorder,
      focusColor: primaryColor,
      hintStyle: const TextStyle(fontSize: 17.0, color: grayColor),
    );
  }

  TextTheme lightTextTheme() {
    return const TextTheme(
      bodyLarge: TextStyle(color: lightTextColor),
      bodyMedium: TextStyle(color: lightTextColor),
      titleLarge: TextStyle(fontSize: 18, color: lightTextColor),
      headlineSmall: TextStyle(color: lightTextColor),
      bodySmall: TextStyle(color: lightTextColor),
    ); //000080
  }
}

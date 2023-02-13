import 'package:flutter/material.dart';

import '../utils/utils.dart';

class TestAppThemeData {
  static const MaterialColor primarySwatch = MaterialColor(0xFF00AD5A, {
    50: Color(0xFFB7FFDD),
    100: Color(0xFF6BFFB8),
    200: Color(0xFF33FF9D),
    300: Color(0xFF00EA7A),
    400: Color(0xFF00CC6A),
    500: Color(0xFF00AD5A),
    600: Color(0xFF008E4A),
    700: Color(0xFF00703A),
    800: Color(0xFF00512A),
    900: Color(0xFF00331A),
  });

  static const Color secondaryColor = Color(0xFFFFA800);
  static final Color successColor = Colors.green.shade500;
  static const Color infoColor = Colors.teal;
  static const Color backgroundColor = Colors.white;
  static final Color cardColor = Colors.grey.shade200;
  static const Color warningColor = Color(0xFFffc107);
  static const Color textColor = Colors.black;
  static final Color dangerColor = Colors.red.withOpacity(.8);
  static final Color disabledColor = Colors.grey.withOpacity(.8);

  static ThemeData appThemeData = ThemeData(
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: primarySwatch,
      accentColor: secondaryColor,
      backgroundColor: backgroundColor,
      primaryColorDark: primarySwatch[700],
      errorColor: dangerColor,
    ),
    disabledColor: disabledColor,
    scaffoldBackgroundColor: backgroundColor,
    textTheme: const TextTheme(
      button: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      headline1: TextStyle(
        fontSize: 49,
        fontWeight: FontWeight.bold,
        color: textColor,
      ),
      headline2: TextStyle(
        fontSize: 42,
        fontWeight: FontWeight.bold,
        color: textColor,
      ),
      headline3: TextStyle(
        fontSize: 35,
        fontWeight: FontWeight.bold,
        color: textColor,
      ),
      headline4: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w500,
        color: textColor,
      ),
      headline5: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w500,
        color: textColor,
      ),
      headline6: TextStyle(
        fontSize: 19,
        fontWeight: FontWeight.w500,
        color: textColor,
      ),
      bodyText1: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: textColor,
      ),
      bodyText2: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: textColor,
      ),
      caption: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: textColor,
      ),
      subtitle1: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: textColor,
      ),
      subtitle2: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: textColor,
      ),
      overline: TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w900,
        color: textColor,
      ),
    ),
    floatingActionButtonTheme: floatingActionButtonThemeData(),
    elevatedButtonTheme: elevatedButtonThemeData(),
    outlinedButtonTheme: outlinedButtonThemeData(),
    buttonTheme: buttonThemeData(),
  );

  static FloatingActionButtonThemeData floatingActionButtonThemeData() =>
      const FloatingActionButtonThemeData(
        backgroundColor: secondaryColor,
        splashColor: Colors.white,
        foregroundColor: Colors.white,
      );

  static ElevatedButtonThemeData elevatedButtonThemeData() =>
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: secondaryColor,
          foregroundColor: Colors.white,
        ),
      );

  static ButtonThemeData buttonThemeData() => const ButtonThemeData(
        buttonColor: secondaryColor,
        textTheme: ButtonTextTheme.accent,
        shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.all(Radius.circular(Utils.normalRadius))),
      );

  static OutlinedButtonThemeData outlinedButtonThemeData() =>
      OutlinedButtonThemeData(
        style: ButtonStyle(
            side: MaterialStateProperty.all(
          const BorderSide(
            style: BorderStyle.solid,
            color: secondaryColor,
            width: 2.0,
          ),
        )),
      );
}

import 'dart:ui';

import 'package:flutter/material.dart';

const Color primaryDarkColor = Color.fromARGB(255, 89, 85, 77);
const Color secondaryLightColor = Color.fromARGB(255, 33, 226, 218);
const Color secondaryDarkColor = const Color.fromARGB(255, 191, 184, 170);
Color shadowColor = Colors.grey.shade700;

ThemeData appTheme() {
  // Const Colors

  return ThemeData(
    brightness: Brightness.light,
    primaryColor: primaryDarkColor,
    shadowColor: shadowColor,
    primaryColorDark: Colors.black87,

    fontFamily: 'Georgia',

    //  Text Theme
    textTheme: const TextTheme(
      headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
      headline6: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic),
      bodyText1: TextStyle(fontSize: 16.0, fontFamily: 'Hind'),
    ),

    // elevatedButtonTheme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          primary: secondaryLightColor,
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          textStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.normal)),
    ),

    // Card Theme
    cardTheme: CardTheme(
      color: Colors.grey.shade100,
      elevation: 0,
      shadowColor: shadowColor,
      shape: RoundedRectangleBorder(
          side: const BorderSide(color: secondaryLightColor, width: 1.0),
          borderRadius: BorderRadius.circular(4.0)),
    ),

    // Floating Button
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      elevation: 16,
      iconSize: 24.0,
      backgroundColor: secondaryLightColor,
    ),

    // Icon Them
    iconTheme: const IconThemeData(
      color: primaryDarkColor,
      size: 20.0,
    ),

    // Button Theme
    // buttonColor: Color.fromARGB(255, 191, 179, 164),
    buttonTheme: ButtonThemeData(
      buttonColor: secondaryLightColor,
      shape: RoundedRectangleBorder(),
      textTheme: ButtonTextTheme.primary,
    ),

    // progressIndicatorTheme
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: secondaryLightColor,
      circularTrackColor: secondaryLightColor,
    ),

    inputDecorationTheme: const InputDecorationTheme(
      labelStyle: TextStyle(fontSize: 14,),
      errorStyle: TextStyle(
          color: primaryDarkColor, fontWeight: FontWeight.bold, fontSize: 14.0),
      border: UnderlineInputBorder(
        borderSide: BorderSide(color: primaryDarkColor, width: 1.0),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: primaryDarkColor, width: 1.0),
      ),
      errorBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: primaryDarkColor, width: 1.0),
      ),
      focusedErrorBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: primaryDarkColor, width: 1.0),
      ),
    ),
  );
}

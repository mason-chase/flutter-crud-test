import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:injectable/injectable.dart';
import 'package:mc_crud_test/presentation/theme/colory.dart';

@lazySingleton
class ThemeConfig {
  static const poppinsFontFamily = 'poppins';

  TextTheme get _poppinsTextTheme => TextTheme(
        displayLarge: TextStyle(
          fontSize: 35.sp,
          fontWeight: FontWeight.w900,
          color: Colors.white,
        ),
        displayMedium: TextStyle(
          fontSize: 25.sp,
          fontWeight: FontWeight.w900,
          color: Colors.white,
        ),
        displaySmall: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.w700,
          color: Colory.neutralColor.shade600,
        ),
        headlineLarge: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          color: Colory.neutralColor.shade600,
        ),
        headlineMedium: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          color: Colory.neutralColor.shade600,
        ),
        headlineSmall: TextStyle(
          fontSize: 15.sp,
          fontWeight: FontWeight.w400,
          color: Colory.neutralColor.shade600,
        ),
        titleLarge: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w900,
          color: Colors.white,
        ),
        titleMedium: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: Colory.neutralColor.shade600,
        ),
        titleSmall: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: Colory.neutralColor.shade400,
        ),
        bodyLarge: TextStyle(
          fontSize: 13.sp,
          fontWeight: FontWeight.w400,
          color: Colors.white,
        ),
        bodyMedium: TextStyle(
          fontSize: 13.sp,
          fontWeight: FontWeight.w400,
          color: Colory.neutralColor.shade400,
        ),
        bodySmall: TextStyle(
          fontSize: 11.sp,
          fontWeight: FontWeight.w500,
          color: Colory.neutralColor.shade500,
        ),
        labelLarge: TextStyle(
          fontSize: 11.sp,
          fontWeight: FontWeight.w900,
          color: Colors.white,
        ),
        labelMedium: TextStyle(
          fontSize: 10.sp,
          fontWeight: FontWeight.w500,
          color: Colory.neutralColor.shade500,
        ),
      );

  MaterialColor get _primarySwatch => Colory.primaryColor;

  Color get _primaryColor => Colory.primaryColor;

  Color get _scaffoldBackgroundColor => Colors.white;

  TextButtonThemeData _textButtonTheme() => TextButtonThemeData(
        style: TextButton.styleFrom(
          backgroundColor: Colory.primaryColor,
          foregroundColor: Colors.white,
          disabledBackgroundColor: Colory.neutralColor.shade200,
          disabledForegroundColor: Colory.neutralColor.shade400,
          fixedSize: Size(1.sw, 60.h),
          textStyle: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
            color: Colory.neutralColor.shade100,
            fontFamily: poppinsFontFamily,
          ),
        ),
      );

  ThemeData themeData() => ThemeData(
        fontFamily: poppinsFontFamily,
        primarySwatch: _primarySwatch,
        primaryColor: _primaryColor,
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
            statusBarBrightness: Brightness.light, // For iOS (dark icons)
          ),
        ),
        scaffoldBackgroundColor: _scaffoldBackgroundColor,
        textButtonTheme: _textButtonTheme(),
        textTheme: _poppinsTextTheme,
      );
}

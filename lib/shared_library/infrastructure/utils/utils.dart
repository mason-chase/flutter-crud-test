import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../styles/test_app_theme_data.dart';

class Utils {
  static const double normalRadius = 8;
  static Size appBarSize = const Size.fromHeight(50);

  static const double smallSize=15;
  static const double mediumSize=20;
  static const double largeSize=30;
  static const double tinySpace = 2;
  static const double smallSpace = 4;
  static const double mediumSpace = 8;
  static const double semiLargeSpace = 12;
  static const double largeSpace = 16;
  static const double giantSpace = 32;
  static const double maxCrossAxisExtent = 100;
  static const double smallMaxCrossAxisExtent = 80;
  static const double maxWith = 700;
  static const double mediumWith = 500;
  static const tinyVerticalSpace = SizedBox(height: Utils.tinySpace);
  static const smallVerticalSpace = SizedBox(height: Utils.smallSpace);
  static const mediumVerticalSpace = SizedBox(height: Utils.mediumSpace);
  static const largeVerticalSpace = SizedBox(height: Utils.largeSpace);
  static const giantVerticalSpace = SizedBox(height: Utils.giantSpace);

  static const tinyHorizontalSpace = SizedBox(width: Utils.tinySpace);
  static const smallHorizontalSpace = SizedBox(width: Utils.smallSpace);
  static const mediumHorizontalSpace = SizedBox(width: Utils.mediumSpace);
  static const largeHorizontalSpace = SizedBox(width: Utils.largeSpace);
  static const giantHorizontalSpace = SizedBox(width: Utils.giantSpace);

  static const mediumPadding = EdgeInsetsDirectional.all(mediumSpace);
  static const smallPadding = EdgeInsetsDirectional.all(smallSpace);
  static const tinyPadding = EdgeInsetsDirectional.all(tinySpace);
  static const largePadding = EdgeInsetsDirectional.all(largeSpace);
  static const giantPadding = EdgeInsetsDirectional.all(giantSpace);

  static late Fluttertoast toast;

  static String displayDateFromUtc(final String utc) =>
      DateTime.parse(utc).toLocal().toString().split(' ').first;

  static void errorToast({required final String message}) =>
      Fluttertoast.showToast(
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 2,
          msg: message,
          webBgColor: '#c62828',
          webPosition: 'center',
          backgroundColor: TestAppThemeData.dangerColor);

  static void successToast({required final String message}) =>
      Fluttertoast.showToast(
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 2,
          webPosition: 'center',
          webBgColor: '#4caf50',
          msg: message,
          backgroundColor: TestAppThemeData.successColor);

  static String? validateText(final String? text) {
    if (text?.isEmpty ?? true) {
      return 'This filed is required';
    }
    return null;
  }

  static String? validateMobile(final String? value) {
    const String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    final RegExp regExp = RegExp(pattern);
    if (value?.isEmpty ?? true) {
      return 'Please enter mobile number';
    } else if (!regExp.hasMatch(value!)) {
      return 'Please enter valid mobile number';
    }
    return null;
  }

  static String? validateEmail(final String? value) {
    if (value?.isNotEmpty ?? true) {
      const String pattern =
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      final RegExp regex = RegExp(pattern);
      if (!regex.hasMatch(value!)) {
        return 'Please Enter Valid Email Address';
      }
    } else {
      return 'Please Enter Email Address';
    }
    return null;
  }

  static String? validateBankAccountNumber(final String? value) {
    if (value?.isNotEmpty ?? true) {
      const String pattern = r'^[0-9]{9,18}$';
      final RegExp regex = RegExp(pattern);
      if (!regex.hasMatch(value!)) {
        return 'Please Enter Valid Account Number';
      }
    } else {
      return 'Please Enter Account Number';
    }
    return null;
  }
}

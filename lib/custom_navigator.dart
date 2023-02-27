import 'package:flutter/material.dart';

class CustomNavigator {
  static final GlobalKey<NavigatorState>? navigatorKey =
      GlobalKey<NavigatorState>();

  static Future<dynamic> pushNamed(
    String routeName, {
    Object? arguments,
  }) async {
    return await navigatorKey?.currentState?.pushNamed(
      routeName,
      arguments: arguments,
    );
  }

  static void pop({dynamic value}) => navigatorKey?.currentState?.pop(value);

  CustomNavigator._();
}

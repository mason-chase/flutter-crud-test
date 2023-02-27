import 'package:flutter/material.dart';
import 'custom_navigator.dart';
import 'routes.dart';

Future<void> main() async {
  runApp(const _MyApp());
}

class _MyApp extends StatefulWidget {
  const _MyApp({Key? key}) : super(key: key);

  @override
  State<_MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<_MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: CustomNavigator.navigatorKey,
      initialRoute: initialRoute,
      onGenerateRoute: onGenerateRoute,
    );
  }
}

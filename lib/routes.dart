import 'package:flutter/material.dart';
import 'package:mc_crud_test/features/customer/presentation/pages/not_found_page.dart';
import 'package:mc_crud_test/features/customer/presentation/pages/home_page.dart';

const String initialRoute = "/";

Route<dynamic>? onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case initialRoute:
      return MaterialPageRoute(builder: (ctx) => const HomePage());
    default:
      return MaterialPageRoute(builder: (ctx) => const NotFoundPage());
  }
}

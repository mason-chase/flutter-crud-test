import 'package:flutter/material.dart';
import 'package:mc_crud_test/features/customer/presentation/pages/add_or_edit_customer_page.dart';
import 'package:mc_crud_test/features/customer/presentation/pages/not_found_page.dart';
import 'package:mc_crud_test/features/customer/presentation/pages/home_page.dart';

const String initialRoute = "/";

Route<dynamic>? onGenerateRoute(RouteSettings settings) {
  var data = settings.arguments as Map<String, dynamic>?;
  switch (settings.name) {
    case initialRoute:
      return MaterialPageRoute(builder: (ctx) => const HomePage());
    case AddOrEditCustomerPage.routeName:
      return MaterialPageRoute(
        builder: (ctx) => AddOrEditCustomerPage(
          model: data?['model'],
        ),
      );
    default:
      return MaterialPageRoute(builder: (ctx) => const NotFoundPage());
  }
}

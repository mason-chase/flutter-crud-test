import 'package:flutter/material.dart';
import 'package:mc_crud_test/app/app_injection.config.dart';
import 'package:mc_crud_test/app/app_routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Flutter Demo',
      routes: AppRoutes.getRoutes(context),
      initialRoute: AppRoutes.customerList,

    );
  }
}

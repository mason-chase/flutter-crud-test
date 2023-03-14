import 'package:flutter/material.dart';
import 'package:flutter_libphonenumber/flutter_libphonenumber.dart';

import 'core/di/di.dart';
import 'features/customer/presentation/pages/customers_page.dart';

void main() async {
  await FlutterLibphonenumber().init();
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const MaterialApp(
        home: CustomersPage(),
        debugShowCheckedModeBanner: false,
      );
}

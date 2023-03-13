import 'package:flutter/material.dart';

import 'features/customer/presentation/pages/customers_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        home: CustomersPage(),
      );
}

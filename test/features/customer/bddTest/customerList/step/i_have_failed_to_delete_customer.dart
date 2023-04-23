import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../test_injection_helper.dart';

Future<void> iHaveFailedToDeleteCustomer(WidgetTester tester) async {
  expect(find.byType(ListView), findsOneWidget);
  expect(find.byType(ListView), findsOneWidget);
  expect(find.byKey(const Key("CustomerItem-0")), findsOneWidget);
  resetInjection();
}

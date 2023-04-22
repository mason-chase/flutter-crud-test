import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> iTapDeleteCustomerButton(WidgetTester tester) async {
  expect(find.byType(ListView), findsOneWidget);
  expect(find.byKey(const Key("delete-0")), findsOneWidget);
  await tester.tap(find.byKey(const Key("delete-0")));
  await tester.pumpAndSettle();
}

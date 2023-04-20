import 'package:flutter_test/flutter_test.dart';
import 'package:mc_crud_test/main.dart';

Future<void> theAppIsRunning(WidgetTester tester) async {
  await tester.pumpWidget(const MyApp());
}

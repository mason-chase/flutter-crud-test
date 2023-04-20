import 'package:flutter_test/flutter_test.dart';
import 'package:mc_crud_test/features/customer/presentation/customerList/widgets/customer_list_empty.widget.dart';

import '../test_injection_helper.dart';

Future<void> iSeeEmptyListWidget(WidgetTester tester) async {
  expect(find.byType(CustomerListEmptyWidget), findsOneWidget);
  resetInjection();
}

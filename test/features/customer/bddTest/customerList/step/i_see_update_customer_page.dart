import 'package:flutter_test/flutter_test.dart';
import 'package:mc_crud_test/features/customer/presentation/addCustomer/add_or_update_customer.page.dart';

import '../../../../test_injection_helper.dart';

Future<void> iSeeUpdateCustomerPage(WidgetTester tester) async {
  await tester.pumpAndSettle();
  expect(find.byType(AddOrUpdateCustomerPage), findsOneWidget);
  resetInjection();
}

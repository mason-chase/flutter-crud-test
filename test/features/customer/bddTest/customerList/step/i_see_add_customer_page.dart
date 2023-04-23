import 'package:flutter_test/flutter_test.dart';
import 'package:mc_crud_test/features/customer/presentation/addCustomer/add_or_update_customer.page.dart';

Future<void> iSeeAddCustomerPage(WidgetTester tester) async {

  await tester.pumpAndSettle();
  expect(find.byType(AddOrUpdateCustomerPage), findsOneWidget);
}

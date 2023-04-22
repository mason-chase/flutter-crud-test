import 'package:flutter_test/flutter_test.dart';
import 'package:mc_crud_test/features/customer/presentation/addCustomer/add_customer.page.dart';

Future<void> iAmOnTheAddCustomerScreen(WidgetTester tester) async {
  expect(find.byType(AddCustomerPage), findsOneWidget);
}

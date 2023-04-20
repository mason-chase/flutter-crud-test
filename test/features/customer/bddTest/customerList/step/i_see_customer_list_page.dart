import 'package:flutter_test/flutter_test.dart';
import 'package:mc_crud_test/features/customer/presentation/customerList/customer_list.page.dart';

Future<void> iSeeCustomerListPage(WidgetTester tester) async {
  expect(find.byType(CustomerListPage), findsOneWidget);
}

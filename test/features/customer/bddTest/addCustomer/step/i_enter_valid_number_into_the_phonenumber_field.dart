import 'package:flutter_test/flutter_test.dart';
import 'package:mc_crud_test/features/customer/presentation/addCustomer/add_customer_form_keys.dart';

import '../../../customer_test.constants.dart';

Future<void> iEnterValidNumberIntoThePhonenumberField(WidgetTester tester) async {
  await tester.enterText(find.byKey(AddCustomerFormKeys.phoneKey), validPhone);
  await tester.pumpAndSettle();
}

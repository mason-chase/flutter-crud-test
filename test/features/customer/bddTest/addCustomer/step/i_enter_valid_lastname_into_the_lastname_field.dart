import 'package:flutter_test/flutter_test.dart';
import 'package:mc_crud_test/core/utils/app.utils.dart';
import 'package:mc_crud_test/features/customer/presentation/addCustomer/add_customer_form_keys.dart';
import 'package:mc_crud_test/features/customer/presentation/addCustomer/bloc/add_customer.bloc.dart';

import '../../../customer_test.constants.dart';

Future<void> iEnterValidLastnameIntoTheLastnameField(WidgetTester tester) async {
  var bloc  = getIt<AddCustomerBloc>();
  await tester.enterText(find.byKey(AddCustomerFormKeys.lastNameKey), validLastname);
  await tester.pumpAndSettle();
}

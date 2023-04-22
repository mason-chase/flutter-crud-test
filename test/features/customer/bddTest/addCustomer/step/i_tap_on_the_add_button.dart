import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mc_crud_test/core/utils/app.utils.dart';
import 'package:mc_crud_test/features/customer/presentation/addCustomer/add_customer_form_keys.dart';
import 'package:mc_crud_test/features/customer/presentation/addCustomer/bloc/add_customer.bloc.dart';
import 'package:mc_crud_test/features/customer/presentation/addCustomer/bloc/add_customer.event.dart';
import 'package:mocktail/mocktail.dart';



Future<void> iTapOnTheAddButton(WidgetTester tester) async {
  var bloc = getIt<AddCustomerBloc>();
  await  tester.tap(find.byKey(AddCustomerFormKeys.submitButtonKey));
  await tester.pumpAndSettle();
}

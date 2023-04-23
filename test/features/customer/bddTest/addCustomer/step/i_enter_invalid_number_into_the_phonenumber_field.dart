import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mc_crud_test/core/models/custom_field.dart';
import 'package:mc_crud_test/core/utils/app.utils.dart';
import 'package:mc_crud_test/features/customer/presentation/addCustomer/add_customer_form_keys.dart';
import 'package:mc_crud_test/features/customer/presentation/addCustomer/bloc/add_customer.bloc.dart';
import 'package:mc_crud_test/features/customer/presentation/addCustomer/bloc/add_customer.state.dart';

import '../../../customer_test.constants.dart';

Future<void> iEnterInvalidNumberIntoThePhonenumberField(
    WidgetTester tester) async {
  var bloc = getIt<AddCustomerBloc>();

  whenListen<AddCustomerState>(
  bloc,
  Stream.fromIterable(
  [const AddCustomerInitial().copyWith(
    phone:  const CustomFiled(
      value: invalidPhone,
      state: FieldState.invalid,
      errorMessage: "Invalid phone",
    )
  )],
  ),
  initialState: const AddCustomerInitial().copyWith(
      phone:  const CustomFiled(
        value: invalidPhone,
        state: FieldState.invalid,
        errorMessage: "Invalid phone",
      )
  ));
  await tester.enterText(
      find.byKey(AddCustomerFormKeys.phoneKey), invalidPhone);
  await tester.pumpAndSettle();
}

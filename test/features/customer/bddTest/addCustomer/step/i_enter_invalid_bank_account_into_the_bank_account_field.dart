import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mc_crud_test/core/models/custom_field.dart';
import 'package:mc_crud_test/core/utils/app.utils.dart';
import 'package:mc_crud_test/features/customer/presentation/addCustomer/add_customer_form_keys.dart';
import 'package:mc_crud_test/features/customer/presentation/addCustomer/bloc/add_customer.bloc.dart';
import 'package:mc_crud_test/features/customer/presentation/addCustomer/bloc/add_customer.state.dart';

import '../../../customer_test.constants.dart';

Future<void> iEnterInvalidBankAccountIntoTheBankAccountField(WidgetTester tester) async {
  var bloc = getIt<AddCustomerBloc>();

  whenListen<AddCustomerState>(
      bloc,
      Stream.fromIterable(
        [const AddCustomerInitial().copyWith(
            bankAccount:  const CustomFiled(
              value: invalidBankAccount,
              state: FieldState.invalid,
              errorMessage: "Invalid bank account",
            )
        )],
      ),
      initialState: const AddCustomerInitial().copyWith(
          bankAccount:  const CustomFiled(
            value: invalidBankAccount,
            state: FieldState.invalid,
            errorMessage: "Invalid bank account",
          )
      ));
  await tester.enterText(
      find.byKey(AddCustomerFormKeys.bankAccountKey), invalidBankAccount);
  await tester.pumpAndSettle();
}

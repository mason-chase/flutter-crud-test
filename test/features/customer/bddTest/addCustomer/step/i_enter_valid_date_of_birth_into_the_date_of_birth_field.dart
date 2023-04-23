import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mc_crud_test/core/models/app_form_state.enum.dart';
import 'package:mc_crud_test/core/models/custom_field.dart';
import 'package:mc_crud_test/core/models/status.enum.dart';
import 'package:mc_crud_test/core/utils/app.utils.dart';
import 'package:mc_crud_test/core/utils/time.util.dart';
import 'package:mc_crud_test/features/customer/presentation/addCustomer/bloc/add_customer.bloc.dart';
import 'package:mc_crud_test/features/customer/presentation/addCustomer/bloc/add_customer.state.dart';

import '../../../customer_test.constants.dart';

Future<void> iEnterValidDateOfBirthIntoTheDateOfBirthField(
    WidgetTester tester) async {
  var bloc = getIt<AddCustomerBloc>();
  whenListen<AddCustomerState>(
      bloc,
      Stream.fromIterable(
        [
          const AddCustomerInitial().copyWith(
              firstname: const CustomFiled(
                value: validFirstname,
                state: FieldState.valid,
                errorMessage: null,
              ),
              lastname: const CustomFiled(
                value: validLastname,
                state: FieldState.valid,
                errorMessage: null,
              ),
              email: const CustomFiled(
                value: validEmail,
                state: FieldState.valid,
                errorMessage: null,
              ),
              phone: const CustomFiled(
                value: validPhone,
                state: FieldState.valid,
                errorMessage: null,
              ),
              bankAccount: const CustomFiled(
                value: validBankAccount,
                state: FieldState.valid,
                errorMessage: null,
              ),
              dateOfBirth: const CustomFiled(
                value: "1992-3-11",
                state: FieldState.valid,
                errorMessage: null,
              ),
              status: Status.initial,
              formState: AppFormState.valid)
        ],
      ),
      initialState: const AddCustomerInitial().copyWith(
          firstname: const CustomFiled(
            value: validFirstname,
            state: FieldState.valid,
            errorMessage: null,
          ),
          lastname: const CustomFiled(
            value: validLastname,
            state: FieldState.valid,
            errorMessage: null,
          ),
          email: const CustomFiled(
            value: validEmail,
            state: FieldState.valid,
            errorMessage: null,
          ),
          phone: const CustomFiled(
            value: validPhone,
            state: FieldState.valid,
            errorMessage: null,
          ),
          bankAccount: const CustomFiled(
            value: validBankAccount,
            state: FieldState.valid,
            errorMessage: null,
          ),
          dateOfBirth: const CustomFiled(
            value: "1992-3-11",
            state: FieldState.valid,
            errorMessage: null,
          ),
          status: Status.initial,
          formState: AppFormState.valid));
  await tester.pumpAndSettle();
  await tester.ensureVisible(find.byType(CupertinoDatePicker));
  await tester.tap(find.byType(CupertinoDatePicker));
  await tester.pump();
  var dateTime = DateTime.now();
  var day = TimeUtil.getDayFromDateTime(dateTime);
  final dayFinder = find.text(day).last;
  await tester.ensureVisible(dayFinder);
  // Apply an offset to scroll
  const offset = Offset(0, -10000);

  // Use both methods: fling and drag
  await tester.fling(
    dayFinder,
    offset,
    1000,
    warnIfMissed: false,
  );

  await tester.drag(
    dayFinder,
    offset,
    warnIfMissed: false,
  );
  await tester.pumpAndSettle();
}

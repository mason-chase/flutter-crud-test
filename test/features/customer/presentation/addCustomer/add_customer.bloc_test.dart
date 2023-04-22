import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mc_crud_test/core/models/app_form_state.enum.dart';
import 'package:mc_crud_test/core/models/custom_field.dart';
import 'package:mc_crud_test/core/models/status.enum.dart';
import 'package:mc_crud_test/features/customer/domain/usecases/add_customer.usecase.dart';
import 'package:mc_crud_test/features/customer/presentation/addCustomer/bloc/add_customer.bloc.dart';
import 'package:mc_crud_test/features/customer/presentation/addCustomer/bloc/add_customer.event.dart';
import 'package:mc_crud_test/features/customer/presentation/addCustomer/bloc/add_customer.state.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../customer_test.constants.dart';
import 'add_customer.bloc_test.mocks.dart';

@GenerateMocks([AddCustomerUseCase])
void main() {
  AddCustomerBloc bloc =
  AddCustomerBloc(addCustomerUseCase: MockAddCustomerUseCase());

  test('initial state is Empty', () {
    expect(bloc.state, equals(AddCustomerInitial()));
  });

  group("firstname validation", () {
    var state = AddCustomerInitial();

    test("should emits invalid FirstnameState when firstname is invalid",
            () async {
          bloc.add(AddInitialCustomer());
          bloc.add(FirstnameChanged(invalidFirstname));
          await pumpEventQueue();
          await expectLater(
              bloc.state,
              state.copyWith(
                  firstname: const CustomFiled(
                    value: invalidFirstname,
                    state: FieldState.invalid,
                    errorMessage: 'Invalid name',
                  ),
                  formState: AppFormState.invalid));
        });

    test("should emits valid FirstnameState when firstname is valid", () async {
      bloc.add(AddInitialCustomer());
      bloc.add(FirstnameChanged(validFirstname));

      await pumpEventQueue();
      await expectLater(
          bloc.state,
          state.copyWith(
              firstname: const CustomFiled(
                value: validFirstname,
                state: FieldState.valid,
                errorMessage: null,
              )));
    });

    // lastname
    test("should emits invalid LastnameState when lastname is invalid",
            () async {
          bloc.add(AddInitialCustomer());
          bloc.add(LastnameChanged(invalidLastname));
          await pumpEventQueue();
          await expectLater(
              bloc.state,
              state.copyWith(
                  lastname: const CustomFiled(
                    value: invalidLastname,
                    state: FieldState.invalid,
                    errorMessage: 'Invalid name',
                  ),
                  formState: AppFormState.invalid));
        });

    test("should emits valid LastnameState when lastname is valid", () async {
      bloc.add(AddInitialCustomer());
      bloc.add(LastnameChanged(validLastname));

      await pumpEventQueue();
      await expectLater(
          bloc.state,
          state.copyWith(
              lastname: const CustomFiled(
                value: validLastname,
                state: FieldState.valid,
                errorMessage: null,
              )));
    });

    test("should emits invalid EmailState when email is invalid", () async {
      bloc.add(AddInitialCustomer());
      bloc.add(EmailChanged(invalidEmail));
      await pumpEventQueue();
      await expectLater(
          bloc.state,
          state.copyWith(
              email: const CustomFiled(
                value: invalidEmail,
                state: FieldState.invalid,
                errorMessage: 'Invalid email',
              ),
              formState: AppFormState.invalid));
    });

    test("should emits valid EmailState when email is valid", () async {
      bloc.add(AddInitialCustomer());
      bloc.add(EmailChanged(validEmail));

      await pumpEventQueue();
      await expectLater(
          bloc.state,
          state.copyWith(
              email: const CustomFiled(
                value: validEmail,
                state: FieldState.valid,
                errorMessage: null,
              )));
    });

    test("should emits invalid PhoneState when phone is invalid", () async {
      bloc.add(AddInitialCustomer());
      bloc.add(PhoneChanged(invalidPhone));
      await pumpEventQueue();
      await expectLater(
          bloc.state,
          state.copyWith(
              phone: const CustomFiled(
                value: invalidPhone,
                state: FieldState.invalid,
                errorMessage: 'Invalid phone',
              ),
              formState: AppFormState.invalid));
    });

    test("should emits valid PhoneState when phone is valid", () async {
      bloc.add(AddInitialCustomer());
      bloc.add(PhoneChanged(validPhone));

      await pumpEventQueue();
      await expectLater(
          bloc.state,
          state.copyWith(
              phone: const CustomFiled(
                value: validPhone,
                state: FieldState.valid,
                errorMessage: null,
              )));
    });

    test("should emits invalid BankAccountState when bank account is invalid",
            () async {
          bloc.add(AddInitialCustomer());
          bloc.add(BankAccountChanged(invalidBankAccount));
          await pumpEventQueue();
          await expectLater(
              bloc.state,
              state.copyWith(
                  bankAccount: const CustomFiled(
                    value: invalidBankAccount,
                    state: FieldState.invalid,
                    errorMessage: 'Invalid bank account',
                  ),
                  formState: AppFormState.invalid));
        });

    test("should emits valid BankAccountState when bank account is valid",
            () async {
          bloc.add(AddInitialCustomer());
          bloc.add(BankAccountChanged(validBankAccount));

          await pumpEventQueue();
          await expectLater(
              bloc.state,
              state.copyWith(
                  bankAccount: const CustomFiled(
                    value: validBankAccount,
                    state: FieldState.valid,
                    errorMessage: null,
                  )));
        });

    test("should emits valid DateOfBirthState when date of birth is valid",
            () async {
          bloc.add(AddInitialCustomer());
          bloc.add(DateOfBirthChanged(validDateOfBirth));

          await pumpEventQueue();
          await expectLater(
              bloc.state,
              state.copyWith(
                  dateOfBirth: const CustomFiled(
                    value: "1992-3-11",
                    state: FieldState.valid,
                    errorMessage: null,
                  )));
        });

    // all data are valid
    test("should emits valid formState when all data are valid", () async {
      bloc.add(AddInitialCustomer());
      bloc.add(FirstnameChanged(validFirstname));
      bloc.add(LastnameChanged(validLastname));
      bloc.add(EmailChanged(validEmail));
      bloc.add(PhoneChanged(validPhone));
      bloc.add(BankAccountChanged(validBankAccount));
      bloc.add(DateOfBirthChanged(validDateOfBirth));


      await pumpEventQueue();
      await expectLater(
          bloc.state,
          state.copyWith(
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
    });



    test("user add customer successfully", () async {
      when(bloc.addCustomerUseCase(tCustomer)).thenAnswer((
          realInvocation) async => const Right(tCustomer));
    });

    // user fail to add customer

    test("user fail to add customer", () async {
      when(bloc.addCustomerUseCase(tCustomer)).thenAnswer((
          realInvocation) async =>  const Left(tFailure));
    });

    test("user fail to add customer because customer all ready exist", () async {
      when(bloc.addCustomerUseCase(tCustomer)).thenAnswer((
          realInvocation) async =>  const Left(tFailureAllReadyExist));
    });

  });
}

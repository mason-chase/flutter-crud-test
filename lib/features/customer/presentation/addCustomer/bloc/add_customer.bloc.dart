import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mc_crud_test/core/models/app_form_state.enum.dart';
import 'package:mc_crud_test/core/models/custom_field.dart';
import 'package:mc_crud_test/core/models/status.enum.dart';
import 'package:mc_crud_test/core/utils/string_validation.ext.util.dart';
import 'package:mc_crud_test/core/utils/time.util.dart';
import 'package:mc_crud_test/features/customer/domain/customer.entity.dart';
import 'package:mc_crud_test/features/customer/domain/usecases/add_customer.usecase.dart';
import 'package:mc_crud_test/features/customer/domain/usecases/update_customer.usecase.dart';
import 'package:mc_crud_test/features/customer/presentation/addCustomer/bloc/add_customer.event.dart';
import 'package:mc_crud_test/features/customer/presentation/addCustomer/bloc/add_customer.state.dart';
import 'package:mc_crud_test/features/customer/presentation/addCustomer/utils/add_customer.util.dart';

class AddCustomerBloc extends Bloc<AddCustomerEvent, AddCustomerState> {
  final AddCustomerUseCase addCustomerUseCase;
  final UpdateCustomerUseCase updateCustomerUseCase;

  AddCustomerBloc({
    required this.addCustomerUseCase,
    required this.updateCustomerUseCase,
  }) : super(const AddCustomerInitial()) {
    on<FirstnameChanged>(_mapFirstnameChangedToState);
    on<LastnameChanged>(_mapLastnameChangedToState);
    on<EmailChanged>(_mapEmailChangedToState);
    on<PhoneChanged>(_mapPhoneChangedToState);
    on<DateOfBirthChanged>(_mapDateOfBirthChangedToState);
    on<BankAccountChanged>(_mapBankAccountChangedToState);
    on<AddOrUpdateCustomer>(_mapAddOrUpdateCustomerToState);
    on<InitialAddCustomer>(_mapAddInitialCustomerToState);
    on<AddCustomer>(_mapInitialCustomerToState);
  }

  _mapAddOrUpdateCustomerToState(
      AddOrUpdateCustomer event, Emitter<AddCustomerState> emit) async {
    if (state.formState == AppFormState.valid) {
      emit(state.copyWith(status: Status.loading));
      var customer = Customer(
        id: state.customer?.id,
        firstname: state.firstname.value!,
        lastname: state.lastname.value!,
        email: state.email.value!,
        phoneNumber: state.phone.value!,
        dateOfBirth: state.dateOfBirth.value!,
        bankAccountNumber: state.bankAccount.value!,
      );
      var result = state.customer != null
          ? await updateCustomerUseCase.call(customer)
          : await addCustomerUseCase.call(customer);
      emit(result.fold(
        (failure) => state.copyWith(
          status: Status.error,
          errorMessage: failure.message,
        ),
        (data) => state.copyWith(
          status: Status.success,
          errorMessage: null,
        ),
      ));
    }
  }

  FutureOr<void> _mapFirstnameChangedToState(
      FirstnameChanged event, Emitter<AddCustomerState> emit) {
    var s = state.copyWith(
        firstname: CustomFiled(
          value: event.firstname,
          state: event.firstname.isName ? FieldState.valid : FieldState.invalid,
          errorMessage: event.firstname.nameValidationMessage(),
        ),
        status: Status.initial);
    emit(_formStateValidation(s));
  }

  FutureOr<void> _mapLastnameChangedToState(
      LastnameChanged event, Emitter<AddCustomerState> emit) {
    var s = state.copyWith(
        lastname: CustomFiled(
          value: event.lastname,
          state: event.lastname.isName ? FieldState.valid : FieldState.invalid,
          errorMessage: event.lastname.nameValidationMessage(),
        ),
        status: Status.initial);
    emit(_formStateValidation(s));
  }

  FutureOr<void> _mapEmailChangedToState(
      EmailChanged event, Emitter<AddCustomerState> emit) {
    var s = state.copyWith(
        email: CustomFiled(
          value: event.email,
          state: event.email.isEmail ? FieldState.valid : FieldState.invalid,
          errorMessage: event.email.emailValidationMessage(),
        ),
        status: Status.initial);
    emit(_formStateValidation(s));
  }

  FutureOr<void> _mapPhoneChangedToState(
      PhoneChanged event, Emitter<AddCustomerState> emit) {
    var s = state.copyWith(
        phone: CustomFiled(
          value: event.phone,
          state: event.phone.isPhone ? FieldState.valid : FieldState.invalid,
          errorMessage: event.phone.phoneValidationMessage(),
        ),
        status: Status.initial);
    emit(_formStateValidation(s));
  }

  FutureOr<void> _mapDateOfBirthChangedToState(
      DateOfBirthChanged event, Emitter<AddCustomerState> emit) {
    var date = TimeUtil.convertDateTimeToString(event.dateOfBirth);
    var s = state.copyWith(
        dateOfBirth: CustomFiled(
          value: date,
          state: date.isDate ? FieldState.valid : FieldState.invalid,
          errorMessage: date.dateValidationMessage(),
        ),
        status: Status.initial);
    emit(_formStateValidation(s));
  }

  FutureOr<void> _mapBankAccountChangedToState(
      BankAccountChanged event, Emitter<AddCustomerState> emit) {
    var s = state.copyWith(
        bankAccount: CustomFiled(
          value: event.bankAccount,
          state: event.bankAccount.isBankAccount
              ? FieldState.valid
              : FieldState.invalid,
          errorMessage: event.bankAccount.bankAccountValidationMessage(),
        ),
        status: Status.initial);
    emit(_formStateValidation(s));
  }

  AddCustomerState _formStateValidation(AddCustomerState s) {
    var formState = AppFormState.initial;
    if (s.firstname.state == FieldState.valid &&
        s.lastname.state == FieldState.valid &&
        s.email.state == FieldState.valid &&
        s.phone.state == FieldState.valid &&
        s.dateOfBirth.state == FieldState.valid &&
        s.bankAccount.state == FieldState.valid) {
      formState = AppFormState.valid;
    } else if (s.firstname.state == FieldState.invalid ||
        s.lastname.state == FieldState.invalid ||
        s.email.state == FieldState.invalid ||
        s.phone.state == FieldState.invalid ||
        s.dateOfBirth.state == FieldState.invalid ||
        s.bankAccount.state == FieldState.invalid) {
      formState = AppFormState.invalid;
    } else {
      formState = AppFormState.initial;
    }
    return s.copyWith(formState: formState);
  }

  FutureOr<void> _mapAddInitialCustomerToState(
      InitialAddCustomer event, Emitter<AddCustomerState> emit) {
    emit(const AddCustomerInitial());
  }

  FutureOr<void> _mapInitialCustomerToState(
      AddCustomer event, Emitter<AddCustomerState> emit) {
    emit(CustomerUtil.mapCustomerToAddCustomerState(event.customer));
  }
}

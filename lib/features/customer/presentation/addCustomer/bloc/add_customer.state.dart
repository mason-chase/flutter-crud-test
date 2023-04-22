import 'package:equatable/equatable.dart';
import 'package:mc_crud_test/core/models/custom_field.dart';
import 'package:mc_crud_test/core/models/app_form_state.enum.dart';
import 'package:mc_crud_test/core/models/status.enum.dart';

class AddCustomerState extends Equatable {
  final CustomFiled firstname;
  final CustomFiled lastname;
  final CustomFiled email;
  final CustomFiled phone;
  final CustomFiled dateOfBirth;
  final CustomFiled bankAccount;
  final AppFormState formState;
  final String? errorMessage;
  final Status status;

  const AddCustomerState({
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.phone,
    required this.dateOfBirth,
    required this.bankAccount,
    this.formState = AppFormState.initial,
    this.status = Status.initial,
    this.errorMessage,
  });

  @override
  List<Object?> get props => [
        firstname,
        lastname,
        email,
        phone,
        dateOfBirth,
        bankAccount,
        formState,
        status,
        errorMessage,
      ];

  copyWith({
    CustomFiled? firstname,
    CustomFiled? lastname,
    CustomFiled? email,
    CustomFiled? phone,
    CustomFiled? dateOfBirth,
    CustomFiled? bankAccount,
    AppFormState? formState,
    Status? status,
    errorMessage,
  }) {
    return AddCustomerState(
      firstname: firstname ?? this.firstname,
      lastname: lastname ?? this.lastname,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      bankAccount: bankAccount ?? this.bankAccount,
      formState: formState ?? this.formState,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

class AddCustomerInitial extends AddCustomerState {
  const AddCustomerInitial()
      : super(
          firstname: const CustomFiled(
              value: '',
              errorMessage: null,
              maxLength: 40,
              state: FieldState.initial),
          lastname: const CustomFiled(
              value: '',
              errorMessage: null,
              maxLength: 40,
              state: FieldState.initial),
          email: const CustomFiled(
              value: '',
              errorMessage: null,
              maxLength: 120,
              state: FieldState.initial),
          phone: const CustomFiled(
              value: '',
              errorMessage: null,
              maxLength: 15,
              state: FieldState.initial),
          dateOfBirth: const CustomFiled(
              value: '',
              errorMessage: null,
              maxLength: 10,
              state: FieldState.initial),
          bankAccount: const CustomFiled(
              value: '',
              errorMessage: null,
              maxLength: 30,
              state: FieldState.initial),
        );
}

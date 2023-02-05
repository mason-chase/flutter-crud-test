part of 'add_customer_bloc.dart';

@freezed
class AddCustomerState with _$AddCustomerState {
  const factory AddCustomerState({
    required MandatoryValue firstName,
    required MandatoryValue lastName,
    required MandatoryValue dateOfBirth,
    required BankAccountNumber bankAccountNumber,
    required PhoneNumber phoneNumber,
    required Email email,
    required bool isSubmitting,
    required bool showErrorMessages,
    required Option<Either<CoreFailure, Unit>> addCustomerFailureOrSuccess,
  }) = _AddCustomerState;

  factory AddCustomerState.initial() => AddCustomerState(
        firstName: MandatoryValue(''),
        lastName: MandatoryValue(''),
        dateOfBirth: MandatoryValue(''),
        bankAccountNumber: BankAccountNumber(''),
        phoneNumber: PhoneNumber(''),
        email: Email(''),
        isSubmitting: false,
        showErrorMessages: false,
        addCustomerFailureOrSuccess: none(),
      );
}

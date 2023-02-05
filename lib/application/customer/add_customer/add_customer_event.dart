part of 'add_customer_bloc.dart';

@freezed
class AddCustomerEvent with _$AddCustomerEvent {
  const factory AddCustomerEvent.initialCustomer(CustomerEntity initialCustomer) =
      _AddCustomerEventInitialCustomer;

  const factory AddCustomerEvent.firstNameChanged(String firstName) =
      _AddCustomerEventFirstNameChanged;

  const factory AddCustomerEvent.lastNameChanged(String lastName) =
      _AddCustomerEventLastNameChanged;

  const factory AddCustomerEvent.dateOfBirthChanged(String dateOfBirth) =
      _AddCustomerEventDateOfBirthChanged;

  const factory AddCustomerEvent.phoneNumberChanged(String phoneNumber) =
      _AddCustomerEventPhoneNumberChanged;

  const factory AddCustomerEvent.emailChanged(String email) = _AddCustomerEventEmailChanged;

  const factory AddCustomerEvent.bankAccountNumberChanged(String bankAccountNumber) =
      _AddCustomerEventBankAccountNumberChanged;

  const factory AddCustomerEvent.addCustomer() = _AddCustomer;

  const factory AddCustomerEvent.updateCustomer() = _UpdateCustomer;
}

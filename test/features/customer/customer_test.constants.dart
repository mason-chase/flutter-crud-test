import 'package:mc_crud_test/core/models/failure.dart';
import 'package:mc_crud_test/features/customer/domain/customer.entity.dart';

const tCustomerList = [
  Customer(
      firstname: 'Mohsen',
      lastname: 'Balestani',
      dateOfBirth: '1992-03-11',
      phoneNumber: '+989353361996',
      email: 'm.balestani@gmail.com',
      bankAccountNumber: '1234567890')
];

const tCustomer = Customer(
    firstname: 'Mohsen',
    lastname: 'Balestani',
    dateOfBirth: '1992-03-11',
    phoneNumber: '+989353361996',
    email: 'm.balestani@gmail.com',
    bankAccountNumber: '1234567890');

const tFailure = DatabaseFailure("Error");
const tFailureAllReadyExist = DatabaseFailure(
    "This customer with this information has already been added");
const String validFirstname = 'Mohsen';
const String invalidFirstname = 'Mohsen123';

const String validLastname = 'Balestani';
const String invalidLastname = 'Balestani123';

const String validEmail = 'm.balestani@gmail.com';
const String invalidEmail = 'm.balestani@gmail';

const String validPhone = '+989353361996';
const String invalidPhone = '+989353361996123';

DateTime validDateOfBirth = DateTime(1992, 03, 11);

const String validBankAccount = '123456789123';
const String invalidBankAccount = 'a1234567890123ss';

getCustomerList() {
  return tCustomerList;
}

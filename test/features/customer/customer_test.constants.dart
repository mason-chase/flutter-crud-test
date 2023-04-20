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

const tFailure = DatabaseFailure("Error");

getCustomerList(){
  return tCustomerList;
}
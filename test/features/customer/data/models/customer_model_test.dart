import 'package:flutter_test/flutter_test.dart';
import 'package:mc_crud_test/features/customer/data/models/customer_model.dart';
import 'package:mc_crud_test/features/customer/domain/entities/customer.dart';

void main() {
  final tCustomerModel = CustomerModel(
    firstname: 'firstname',
    lastname: 'lastname',
    dateOfBirth: 'dateOfBirth',
    phoneNumber: 'phoneNumber',
    email: 'email',
    bankAccountNumber: 'bankAccountNumber',
  );

  test('check the customer model', () {
    expect(tCustomerModel, isA<Customer>());
  });
}

import 'package:mc_crud_test/features/customer/domain/entities/customer.dart';

class CustomerModel extends Customer {
  CustomerModel({
    required String email,
    required String firstname,
    required String lastname,
    required String phoneNumber,
    required String dateOfBirth,
    required String bankAccountNumber,
  }) : super(
          email: email,
          firstname: firstname,
          lastname: lastname,
          phoneNumber: phoneNumber,
          dateOfBirth: dateOfBirth,
          bankAccountNumber: bankAccountNumber,
        );
}

import 'package:equatable/equatable.dart';

class CustomerEntity extends Equatable {
  const CustomerEntity({
    required this.firstName,
    required this.lastName,
    required this.dateOfBirth,
    required this.phoneNumber,
    required this.email,
    required this.bankAcountNumber,
  });

  final String firstName;
  final String lastName;
  final String dateOfBirth;
  final String phoneNumber;
  final String email;
  final String bankAcountNumber;

  @override
  List<Object?> get props => [
        firstName,
        lastName,
        dateOfBirth,
        phoneNumber,
        email,
        bankAcountNumber,
      ];
}

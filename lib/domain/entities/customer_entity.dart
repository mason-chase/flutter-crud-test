import '../../data/dtos/customer/customer_dto.dart';

class CustomerEntity {
  final String id;
  final String firstName;
  final String lastName;
  final String dateOfBirth;
  final String phoneNumber;
  final String email;
  final String bankAccountNumber;

  CustomerEntity({
    required this.firstName,
    required this.id,
    required this.lastName,
    required this.dateOfBirth,
    required this.phoneNumber,
    required this.email,
    required this.bankAccountNumber,
  });

  factory CustomerEntity.fromDto({
    required final String id,
    required final CustomerDto dto,
  }) =>
      CustomerEntity(
        id: id,
        firstName: dto.firstName,
        lastName: dto.lastName,
        dateOfBirth: dto.dateOfBirth,
        phoneNumber: dto.phoneNumber,
        email: dto.email,
        bankAccountNumber: dto.bankAccountNumber,
      );
}

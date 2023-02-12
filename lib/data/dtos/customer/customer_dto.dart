class CustomerDto {

  final String firstName;
  final String lastName;
  final String dateOfBirth;
  final String phoneNumber;
  final String email;
  final String bankAccountNumber;

  CustomerDto({
    required this.firstName,
    required this.lastName,
    required this.dateOfBirth,
    required this.phoneNumber,
    required this.email,
    required this.bankAccountNumber,
  });

  factory CustomerDto.fromMap(final Map<String, dynamic> map) => CustomerDto(
        firstName: map['firstName'],
        lastName: map['lastName'],
        dateOfBirth: map['dateOfBirth'],
        phoneNumber: map['phoneNumber'],
        email: map['email'],
        bankAccountNumber: map['bankAccountNumber'],
      );

  Map<String, dynamic> toMap() => {
        'firstName': firstName,
        'lastName': lastName,
        'dateOfBirth': dateOfBirth,
        'phoneNumber': phoneNumber,
        'email': email,
        'bankAccountNumber': bankAccountNumber,
      };
}

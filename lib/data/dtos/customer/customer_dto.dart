class CustomerDto {
   String? id;
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
    this.id,
  });

  factory CustomerDto.fromMap(final Map<String, dynamic> map) => CustomerDto(
        firstName: map['firstName'],
        id: map['id'],
        lastName: map['lastName'],
        dateOfBirth: map['dateOfBirth'],
        phoneNumber: map['phoneNumber'],
        email: map['email'],
        bankAccountNumber: map['bankAccountNumber'],
      );

  Map<String, dynamic> toMap(final String id) => {
        'firstName': firstName,
        'id': id,
        'lastName': lastName,
        'dateOfBirth': dateOfBirth,
        'phoneNumber': phoneNumber,
        'email': email,
        'bankAccountNumber': bankAccountNumber,
      };
}

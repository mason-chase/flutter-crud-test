import 'package:hive/hive.dart';

part 'customer_dto.g.dart';

@HiveType(typeId: 1)
class CustomerDTO {
  CustomerDTO({
    this.firstName,
    this.lastName,
    this.dateOfBirth,
    this.phoneNumber,
    this.email,
    this.bankAcountNumber,
  });

  @HiveField(0)
  String? firstName;
  @HiveField(1)
  String? lastName;
  @HiveField(2)
  String? dateOfBirth;
  @HiveField(3)
  String? phoneNumber;
  @HiveField(4)
  String? email;
  @HiveField(5)
  String? bankAcountNumber;

  factory CustomerDTO.fromJson(Map<String, dynamic>? json) => CustomerDTO(
        firstName: json?["firstName"] ?? "",
        lastName: json?["lastName"] ?? "",
        dateOfBirth: json?["dateOfBirth"] ?? "",
        phoneNumber: json?["phoneNumber"] ?? "",
        email: json?["email"] ?? "",
        bankAcountNumber: json?["bankAcountNumber"] ?? "",
      );

  Map<String, dynamic>? toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "dateOfBirth": dateOfBirth,
        "phoneNumber": phoneNumber,
        "email": email,
        "bankAcountNumber": bankAcountNumber,
      };
}

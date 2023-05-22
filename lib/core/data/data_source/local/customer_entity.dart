import 'package:floor/floor.dart';

@Entity(indices: [
  Index(value: ["firstName", "lastName", "dateOfBirth", "email"], unique: true)
])
class CustomerEntity {
  @PrimaryKey(
    autoGenerate: true,
  )
  int? id;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? email;
  String? bankAccountNumber;
  String? dateOfBirth;

  CustomerEntity({
    this.id,
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.email,
    this.bankAccountNumber,
    this.dateOfBirth,
  });
}

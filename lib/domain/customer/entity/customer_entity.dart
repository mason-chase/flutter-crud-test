import 'package:floor/floor.dart';
import 'package:mc_crud_test/infrastructure/database/database.dart';

@Entity(tableName: AppDatabase.customerTable, indices: [
  Index(value: [
    "firstName",
    "lastName",
    "dateOfBirth",
  ], unique: true),
  Index(value: [
    "email",
  ], unique: true),
])
class CustomerEntity {
  @PrimaryKey(autoGenerate: true)
  final int? id;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String email;
  final String bankAccountNumber;
  final String dateOfBirth;

  CustomerEntity({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.email,
    required this.bankAccountNumber,
    required this.dateOfBirth,
  });
}

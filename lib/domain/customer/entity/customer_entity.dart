import 'package:floor/floor.dart';
import 'package:mc_crud_test/infrastructure/database/database.dart';

@Entity(tableName: AppDatabase.customerTable, indices: [
  Index(value: [
    "firstName",
    "lastName",
    "dateOfBirth",
    "email",
  ], unique: true)
])
class CustomerEntity {
  @PrimaryKey(autoGenerate: true)
  int id;
  String firstName;
  String lastName;
  String phoneNumber;
  String email;
  String bankAccountNumber;
  String dateOfBirth;

  CustomerEntity({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.email,
    required this.bankAccountNumber,
    required this.dateOfBirth,
  });
}

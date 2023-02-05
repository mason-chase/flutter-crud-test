import 'package:floor/floor.dart';
import 'package:mc_crud_test/application/customer/add_customer/add_customer_bloc.dart';
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

  factory CustomerEntity.fromState(AddCustomerState customerState, {int? id}) {
    return CustomerEntity(
      id: id,
      firstName: customerState.firstName.getOrCrash().trim(),
      lastName: customerState.lastName.getOrCrash().trim(),
      phoneNumber: customerState.phoneNumber.getOrCrash().trim(),
      email: customerState.email.getOrCrash().trim(),
      bankAccountNumber: customerState.bankAccountNumber.getOrCrash().trim(),
      dateOfBirth: customerState.dateOfBirth.getOrCrash().trim(),
    );
  }
}

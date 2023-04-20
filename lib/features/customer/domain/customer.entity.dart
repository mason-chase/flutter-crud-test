import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';
import 'package:mc_crud_test/app/app.constants.dart';
@Entity(tableName: AppConstants.customerTable, indices: [
  Index(value: [
    "firstname",
    "lastname",
    "dateOfBirth",
  ], unique: true),
  Index(value: [
    "email",
  ], unique: true),
])
class Customer extends Equatable{
  @PrimaryKey(autoGenerate: true)
  final int? id;
  final String firstname;
  final String lastname;
  final String dateOfBirth;
  final String phoneNumber;
  final String email;
  final String bankAccountNumber;

  const Customer({
    this.id,
    required this.firstname,
    required this.lastname,
    required this.dateOfBirth,
    required this.phoneNumber,
    required this.email,
    required this.bankAccountNumber,
  });

  @override
  List<Object?> get props => [
    firstname,
    lastname,
    dateOfBirth,
    phoneNumber,
    email,
    bankAccountNumber,
  ];
}
import 'package:floor/floor.dart';

@entity
class CustomerEntity {

  @PrimaryKey(autoGenerate: true,)
  int? id;

  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? email;
  String? bankAccountNumber;
  int? dateOfBirth;
}
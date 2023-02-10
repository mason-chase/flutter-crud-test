import 'package:hive_flutter/hive_flutter.dart';

part 'hive_database.g.dart';

@HiveType(typeId: 0)
class Database {
  @HiveField(0)
  final String firstName;
  @HiveField(1)
  final String lastName;
  @HiveField(2)
  final DateTime dateOfBirth;
  @HiveField(3)
  final String phoneNumber;
  @HiveField(4)
  final String email;
  @HiveField(5)
  final String bankAccountNumber;


  Database(this.firstName, this.lastName, this.dateOfBirth, this.phoneNumber,
      this.email, this.bankAccountNumber, );
}

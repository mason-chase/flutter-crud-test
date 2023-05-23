import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'customer.g.dart';

@HiveType(typeId: 0)
class Customer extends HiveObject with EquatableMixin {
  @HiveField(0)
  final String email;
  @HiveField(1)
  final String firstname;
  @HiveField(2)
  final String lastname;
  @HiveField(3)
  final String phoneNumber;
  @HiveField(4)
  final String dateOfBirth;
  @HiveField(5)
  final String bankAccountNumber;

  Customer({
    required this.email,
    required this.firstname,
    required this.lastname,
    required this.phoneNumber,
    required this.dateOfBirth,
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

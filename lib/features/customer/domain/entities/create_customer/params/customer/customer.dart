import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer.g.dart';

///
/// Customer Entity
///
@JsonSerializable()
// ignore: must_be_immutable
class Customer extends Equatable {
  String? id;
  String firstName,
      lastName,
      email,
      phoneNumber,
      bankAccountNumber,
      dateOfBirth;

  Customer(
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
    this.bankAccountNumber,
    this.dateOfBirth,
    this.id,
  );

  Map<String, dynamic> toJson() => _$CustomerToJson(this);

  factory Customer.fromJson(Map<String, dynamic> data) =>
      _$CustomerFromJson(data);

  @override
  List<Object?> get props => [dateOfBirth, email, firstName, lastName];
}

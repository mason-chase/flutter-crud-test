import 'package:equatable/equatable.dart';

class AddCustomerEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AddNewCustomer extends AddCustomerEvent {
  AddNewCustomer();
}

class AddInitialCustomer extends AddCustomerEvent {
  AddInitialCustomer();
}

class FirstnameChanged extends AddCustomerEvent {
  final String firstname;
  FirstnameChanged(this.firstname);
  @override
  List<Object?> get props => [firstname];
}

class LastnameChanged extends AddCustomerEvent {
  final String lastname;
  LastnameChanged(this.lastname);
  @override
  List<Object?> get props => [lastname];
}

class EmailChanged extends AddCustomerEvent {
  final String email;
  EmailChanged(this.email);
  @override
  List<Object?> get props => [email];
}

class PhoneChanged extends AddCustomerEvent {
  final String phone;
  PhoneChanged(this.phone);
  @override
  List<Object?> get props => [phone];
}

class DateOfBirthChanged extends AddCustomerEvent {
  final DateTime dateOfBirth;
  DateOfBirthChanged(this.dateOfBirth);
  @override
  List<Object?> get props => [dateOfBirth];
}

class BankAccountChanged extends AddCustomerEvent {
  final String bankAccount;
  BankAccountChanged(this.bankAccount);
  @override
  List<Object?> get props => [bankAccount];
}
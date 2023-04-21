import 'package:equatable/equatable.dart';
import 'package:mc_crud_test/features/customer/domain/customer.entity.dart';

class AddCustomerEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AddNewCustomer extends AddCustomerEvent {
  final Customer customer;

  AddNewCustomer(this.customer);

  @override
  List<Object?> get props => [customer];
}

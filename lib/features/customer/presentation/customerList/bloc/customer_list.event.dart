import 'package:equatable/equatable.dart';
import 'package:mc_crud_test/features/customer/domain/customer.entity.dart';

class CustomerListEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetCustomerList extends CustomerListEvent {}

class DeleteCustomer extends CustomerListEvent {
  final Customer customer;

  DeleteCustomer(this.customer);
}

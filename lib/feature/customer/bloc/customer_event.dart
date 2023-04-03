part of 'customer_bloc.dart';

class CustomerEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AddCustomer extends CustomerEvent {
  AddCustomer({required this.customerData});

  CustomerDTO customerData;

  @override
  List<Object?> get props => [customerData];
}

class GetCustomers extends CustomerEvent {}

class SelectCustomer extends CustomerEvent {
  SelectCustomer({required this.selectedCustomerIndex});

  final int selectedCustomerIndex;

  @override
  List<Object?> get props => [selectedCustomerIndex];
}

class UpdateCustomerEvent extends CustomerEvent {
  UpdateCustomerEvent({required this.selectedCustomerIndex, required this.customerData, required this.index});
  final int selectedCustomerIndex;
  final CustomerDTO customerData;
  final int index;

  @override
  List<Object?> get props => [selectedCustomerIndex, customerData, index];
}

class DeleteCustomer extends CustomerEvent {
  DeleteCustomer({required this.selectedCustomerIndex});
  final int selectedCustomerIndex;

  @override
  List<Object?> get props => [selectedCustomerIndex];
}

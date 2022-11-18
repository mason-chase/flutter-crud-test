part of 'delete_customer_bloc.dart';

// @immutable
// abstract class DeleteCustomerEvent {}

class DeleteCustomerEvent {
  CustomerEntity customer;

  DeleteCustomerEvent(this.customer);
}


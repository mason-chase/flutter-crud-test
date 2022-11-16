part of 'delete_customer_bloc.dart';

// @immutable
// abstract class DeleteCustomerEvent {}

@immutable
class DeleteCustomerEvent {
  int customerId;

  DeleteCustomerEvent(this.customerId);
}


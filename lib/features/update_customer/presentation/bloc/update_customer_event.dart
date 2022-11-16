part of 'update_customer_bloc.dart';

// @immutable
// abstract class UpdateCustomerEvent {}

@immutable
class UpdateCustomerEvent {
  CustomerEntity customer;

  UpdateCustomerEvent(this.customer);
}
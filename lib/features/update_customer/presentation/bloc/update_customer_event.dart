part of 'update_customer_bloc.dart';


@immutable
class UpdateCustomerEvent {
  CustomerEntity customer;

  UpdateCustomerEvent(this.customer);
}
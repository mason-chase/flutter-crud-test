part of 'add_customer_bloc.dart';

@immutable
abstract class AddCustomerEvent {}


class NewCustomerEvent extends AddCustomerEvent {
  CustomerEntity customerEntity;

  NewCustomerEvent(this.customerEntity);
}


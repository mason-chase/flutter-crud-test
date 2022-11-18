part of 'customers_bloc.dart';

@immutable
abstract class CustomersEvent {}

class GetAllCustomersEvent extends CustomersEvent {
  GetAllCustomersEvent();
}




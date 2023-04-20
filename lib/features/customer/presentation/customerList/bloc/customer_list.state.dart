import 'package:equatable/equatable.dart';
import 'package:mc_crud_test/features/customer/domain/customer.entity.dart';

class CustomerListState extends Equatable{
  @override
  List<Object?> get props => [];
}

class Empty extends CustomerListState{}

class Loading extends CustomerListState{}

class ListLoaded extends CustomerListState{
  final List<Customer> customers;
  ListLoaded(this.customers);
}

class Error extends CustomerListState{
  final String message;
  Error(this.message);

}

class Deleted extends CustomerListState{}


class Edited extends CustomerListState{}




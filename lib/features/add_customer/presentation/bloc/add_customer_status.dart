
import 'package:equatable/equatable.dart';
import 'package:mc_crud_test/core/data/data_source/local/customer_entity.dart';

abstract class AddCustomerStatus extends Equatable {}

class AddCustomerInitial extends AddCustomerStatus {
  @override
  List<Object?> get props => [];
}

class AddCustomerLoading extends AddCustomerStatus {
  @override
  List<Object?> get props => [];
}

class AddCustomerCompleted extends AddCustomerStatus {
  final CustomerEntity customerEntity;

  AddCustomerCompleted(this.customerEntity);

  @override
  List<Object?> get props => [customerEntity];
}

class AddCustomerError extends AddCustomerStatus {
  final String? message;

  AddCustomerError(this.message);

  @override
  List<Object?> get props => [message];
}

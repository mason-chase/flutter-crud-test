import 'package:equatable/equatable.dart';
import 'package:mc_crud_test/core/data/data_source/local/customer_entity.dart';
import 'package:mc_crud_test/features/get_customers/presentation/bloc/customers_bloc.dart';

abstract class CustomersStatus extends Equatable{}



class CustomersLoading extends CustomersState {
  @override
  List<Object?> get props => [];
}



class GetAllCustomersCompleted extends CustomersStatus {
  final List<CustomerEntity> customerList;
  GetAllCustomersCompleted(this.customerList);

  @override
  List<Object?> get props => [customerList];
}



class GetAllCustomersError extends CustomersStatus {
  final String? message;

  GetAllCustomersError(this.message);

  @override
  List<Object?> get props => [message];
}

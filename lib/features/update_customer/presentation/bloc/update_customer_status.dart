
import 'package:equatable/equatable.dart';

import '../../../../core/data/data_source/local/customer_entity.dart';

abstract class UpdateCustomerStatus extends Equatable {}



class UpdateCustomerLoading extends UpdateCustomerStatus {
  @override
  List<Object?> get props => [];
}

class UpdateCustomerCompleted extends UpdateCustomerStatus {
  final CustomerEntity customer;

  UpdateCustomerCompleted(this.customer);

  @override
  List<Object?> get props => [customer];
}

class UpdateCustomerError extends UpdateCustomerStatus {
  final String? message;

  UpdateCustomerError(this.message);

  @override
  List<Object?> get props => [message];
}

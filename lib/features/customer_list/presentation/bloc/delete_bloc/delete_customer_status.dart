
import 'package:equatable/equatable.dart';


abstract class DeleteCustomerStatus extends Equatable {}


class DeleteCustomerInitial extends DeleteCustomerStatus {
  @override
  List<Object?> get props => [];
}



class DeleteCustomerLoading extends DeleteCustomerStatus {
  @override
  List<Object?> get props => [];
}

class DeleteCustomerCompleted extends DeleteCustomerStatus {
  final int customerId;

  DeleteCustomerCompleted(this.customerId);

  @override
  List<Object?> get props => [customerId];
}

class DeleteCustomerError extends DeleteCustomerStatus {
  final String? message;

  DeleteCustomerError(this.message);

  @override
  List<Object?> get props => [message];
}

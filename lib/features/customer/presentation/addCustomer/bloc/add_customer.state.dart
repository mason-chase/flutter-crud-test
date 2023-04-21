import 'package:equatable/equatable.dart';

class AddCustomerState extends Equatable{
  @override
  List<Object?> get props => [];
}

class AddCustomerInitial extends AddCustomerState{}
class AddCustomerLoading extends AddCustomerState{}
class CustomerAdded extends AddCustomerState{}
class AddCustomerError extends AddCustomerState{
  final String message;
  AddCustomerError(this.message);
}

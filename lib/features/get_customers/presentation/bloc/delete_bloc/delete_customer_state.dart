part of 'delete_customer_bloc.dart';


class DeleteCustomerState extends Equatable {
  DeleteCustomerStatus deleteCustomerStatus;

  DeleteCustomerState({required this.deleteCustomerStatus});

  DeleteCustomerState copyWith(
      {DeleteCustomerStatus? newDeleteCustomerStatus,
      }) {
    return DeleteCustomerState(
      deleteCustomerStatus: newDeleteCustomerStatus ?? deleteCustomerStatus,
    );
  }

  @override
  List<Object?> get props => [
    deleteCustomerStatus
  ];
}

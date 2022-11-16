part of 'update_customer_bloc.dart';


class UpdateCustomerState extends Equatable{



  UpdateCustomerStatus updateCustomerStatus;

  UpdateCustomerState({required this.updateCustomerStatus});

  UpdateCustomerState copyWith(
      {UpdateCustomerStatus? newUpdateCustomerStatus,
      }) {
    return UpdateCustomerState(
      updateCustomerStatus: newUpdateCustomerStatus ?? updateCustomerStatus,
    );
  }


  @override
  List<Object?> get props => [updateCustomerStatus];
}

// class UpdateCustomerInitial extends UpdateCustomerState {}

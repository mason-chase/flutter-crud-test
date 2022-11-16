part of 'add_customer_bloc.dart';


class AddCustomerState extends Equatable {
  AddCustomerStatus addCustomerStatus;

  AddCustomerState({required this.addCustomerStatus});

  AddCustomerState copyWith(
      {AddCustomerStatus? newCustomerStatus,
      }) {
    return AddCustomerState(
      addCustomerStatus: newCustomerStatus ?? addCustomerStatus,
    );
  }

  @override
  List<Object?> get props => [
    addCustomerStatus
  ];
}

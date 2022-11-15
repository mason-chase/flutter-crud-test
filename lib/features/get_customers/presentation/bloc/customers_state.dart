part of 'customers_bloc.dart';

class CustomersState extends Equatable {
  CustomersStatus getAllCustomersStatus;

  CustomersState({required this.getAllCustomersStatus});

  CustomersState copyWith(
      {CustomersStatus? newListStatus,
      }) {
    return CustomersState(
      getAllCustomersStatus: newListStatus ?? getAllCustomersStatus,
    );
  }

  @override
  List<Object?> get props => [
        getAllCustomersStatus
      ];
}

part of 'customer_bloc.dart';

enum CustomerStatus {
  initial,
  success,
  error,
  loading,
  selected,
  deleted,
  updated
}

extension CustomerStatusX on CustomerStatus {
  bool get isInitial => this == CustomerStatus.initial;
  bool get isSuccess => this == CustomerStatus.success;
  bool get isError => this == CustomerStatus.error;
  bool get isLoading => this == CustomerStatus.loading;
  bool get isSelected => this == CustomerStatus.selected;
  bool get isDeleted => this == CustomerStatus.deleted;
  bool get isUpdated => this == CustomerStatus.updated;
}

class CustomerState extends Equatable {
  const CustomerState({
    this.status = CustomerStatus.initial,
    List<CustomerEntity>? customers,
    int selectedCustomerIndex = 0,
  })  : customers = customers ?? const [],
        selectedCustomerIndex = selectedCustomerIndex;

  final List<CustomerEntity> customers;
  final CustomerStatus status;
  final int selectedCustomerIndex;

  @override
  List<Object?> get props => [status, customers, selectedCustomerIndex];

  CustomerState copyWith({
    List<CustomerEntity>? customers,
    CustomerStatus? status,
    int? selectedCustomerIndex,
  }) {
    return CustomerState(
      customers: customers ?? this.customers,
      status: status ?? this.status,
      selectedCustomerIndex:
          selectedCustomerIndex ?? this.selectedCustomerIndex,
    );
  }
}

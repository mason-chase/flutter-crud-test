part of 'customer_bloc.dart';

enum CustomerStatus {
  initial,
  success,
  error,
  added,
  loading,
  selected,
  deleted,
  updated,
  notDeleted,
}

extension CustomerStatusX on CustomerStatus {
  bool get isInitial => this == CustomerStatus.initial;
  bool get isSuccess => this == CustomerStatus.success;
  bool get isError => this == CustomerStatus.error;
  bool get isLoading => this == CustomerStatus.loading;
  bool get isSelected => this == CustomerStatus.selected;
  bool get isAdded => this == CustomerStatus.added;
  bool get isDeleted => this == CustomerStatus.deleted;
  bool get isUpdated => this == CustomerStatus.updated;
  bool get notDeleted => this == CustomerStatus.notDeleted;
}

class CustomerState extends Equatable {
  const CustomerState({
    this.status = CustomerStatus.initial,
    List<CustomerEntity>? customers,
    int selectedCustomerIndex = 0,
    bool isUpdating = false,
    CustomerEntity? updatingCustomer,
  })  : customers = customers ?? const [],
        isUpdating = isUpdating,
        updatingCustomer = updatingCustomer,
        selectedCustomerIndex = selectedCustomerIndex;

  final List<CustomerEntity> customers;
  final CustomerStatus status;
  final int selectedCustomerIndex;
  final bool isUpdating;
  final CustomerEntity? updatingCustomer;

  @override
  List<Object?> get props =>
      [status, customers, selectedCustomerIndex, isUpdating, updatingCustomer];

  CustomerState copyWith({
    List<CustomerEntity>? customers,
    CustomerStatus? status,
    bool? isUpdating,
    CustomerEntity? updatingCustomer,
    int? selectedCustomerIndex,
  }) {
    return CustomerState(
      customers: customers ?? this.customers,
      status: status ?? this.status,
      isUpdating: isUpdating ?? this.isUpdating,
      updatingCustomer: updatingCustomer ?? this.updatingCustomer,
      selectedCustomerIndex:
          selectedCustomerIndex ?? this.selectedCustomerIndex,
    );
  }
}

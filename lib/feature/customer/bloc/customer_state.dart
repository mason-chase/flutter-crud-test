part of 'customer_bloc.dart';

enum CustomerStatus {
  initial,
  success,
  error,
  added,
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
  bool get isAdded => this == CustomerStatus.added;
  bool get isDeleted => this == CustomerStatus.deleted;
  bool get isUpdated => this == CustomerStatus.updated;
}

class CustomerState extends Equatable {
  const CustomerState({
    this.status = CustomerStatus.initial,
    List<CustomerEntity>? customers,
    int selectedCustomerIndex = 0,
    bool isUpdating = false,
    CustomerEntity? updatingCusomer,
  })  : customers = customers ?? const [],
        isUpdating = isUpdating,
        updatingCusomer = updatingCusomer ?? const CustomerEntity(
                firstName: "",
                lastName: "",
                dateOfBirth: "",
                phoneNumber: "",
                email: "",
                bankAcountNumber: ""),
        selectedCustomerIndex = selectedCustomerIndex;

  final List<CustomerEntity> customers;
  final CustomerStatus status;
  final int selectedCustomerIndex;
  final bool isUpdating;
  final CustomerEntity updatingCusomer;

  @override
  List<Object?> get props =>
      [status, customers, selectedCustomerIndex, isUpdating, updatingCusomer];

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
      updatingCusomer: updatingCusomer,
      selectedCustomerIndex:
          selectedCustomerIndex ?? this.selectedCustomerIndex,
    );
  }
}

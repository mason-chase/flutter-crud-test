import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/customer.dart';

part 'customer_state.freezed.dart';

@freezed
class CustomerState with _$CustomerState {
  const factory CustomerState.initial(bool isLoading) = CustomerInitial;
  const factory CustomerState.error(String message, bool isLoading) = CustomerError;
  const factory CustomerState.successGetById(Customer? data, bool isLoading) = CustomerSuccessById;
  const factory CustomerState.successDeleted(bool isLoading) = CustomerSuccessDeleted;
  const factory CustomerState.successAdded(Customer data,bool isLoading) = CustomerSuccessAdded;
  const factory CustomerState.successEdited(Customer data,bool isLoading) = CustomerSuccessEdited;
  const factory CustomerState.successGetCustomers(List<Customer> data, bool isLoading) = CustomerSuccess;
}

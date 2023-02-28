import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/customer.dart';

part 'customer_event.freezed.dart';

@freezed
class CustomerEvent with _$CustomerEvent {
  const factory CustomerEvent.getCustomers() = GetCustomers;

  const factory CustomerEvent.getCustomerById(String id) = GetCustomerById;

  const factory CustomerEvent.editCustomer(Customer customer) = EditCustomer;

  const factory CustomerEvent.addCustomer(Customer customer) = AddCustomer;

  const factory CustomerEvent.deleteCustomer(String id) = DeleteCustomer;
}

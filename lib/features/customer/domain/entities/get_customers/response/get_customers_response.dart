import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../create_customer/params/customer/customer.dart';

part 'get_customers_response.g.dart';

@JsonSerializable(createToJson: false)
class GetCustomersResponse extends Equatable {
  final List<Customer> customers;

  factory GetCustomersResponse.fromJson(Map<String, dynamic> data) =>
      _$GetCustomersResponseFromJson(data);

  const GetCustomersResponse(this.customers);

  @override
  List<Object?> get props => [customers];
}

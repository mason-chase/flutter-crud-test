import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


import '../params/customer/customer.dart';

part 'create_customer_response.g.dart';


///
/// Create customer response

@JsonSerializable(createToJson: false)
class CreateCustomerResponse extends Equatable {
  final Customer customer;

  factory CreateCustomerResponse.fromJson(Map<String, dynamic> data) =>
      _$CreateCustomerResponseFromJson(data);

  const CreateCustomerResponse(this.customer);

  @override
  List<Object?> get props => [customer];
}

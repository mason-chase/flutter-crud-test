import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mc_crud_test/features/customer/domain/entities/create_customer/params/customer/customer.dart';

part 'update_customer_response.g.dart';

@JsonSerializable(createToJson: false)
class UpdateCustomerResponse extends Equatable {
  final Customer customer;
  factory UpdateCustomerResponse.fromJson(Map<String, dynamic> data) =>
      _$UpdateCustomerResponseFromJson(data);

  const UpdateCustomerResponse(this.customer);

  @override
  List<Object?> get props => [customer];
}

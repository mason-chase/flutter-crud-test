import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'customer/customer.dart';

part 'create_customer_params.g.dart';

///
/// Create customer params

@JsonSerializable(createFactory: false)
class CreateCustomerParams extends Equatable {
  final Customer customer;

  const CreateCustomerParams(this.customer);

  Map<String, dynamic> toJson() => _$CreateCustomerParamsToJson(this);

  @override
  List<Object?> get props => [customer];
}

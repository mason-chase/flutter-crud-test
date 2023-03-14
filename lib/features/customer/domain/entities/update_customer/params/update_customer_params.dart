import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../create_customer/params/customer/customer.dart';

part 'update_customer_params.g.dart';

@JsonSerializable(createFactory: false)
class UpdateCustomerParams extends Equatable {
  final Customer customer;
  const UpdateCustomerParams(this.customer);

  Map<String, dynamic> toJson() => _$UpdateCustomerParamsToJson(this);

  @override
  List<Object?> get props => [customer];
}

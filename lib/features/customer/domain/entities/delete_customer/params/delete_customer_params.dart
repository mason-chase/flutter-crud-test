import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_customer_params.g.dart';

@JsonSerializable(createFactory: false)
class DeleteCustomerParams extends Equatable {
  final String customerId;

  const DeleteCustomerParams(this.customerId);
  Map<String, dynamic> toJson() => _$DeleteCustomerParamsToJson(this);

  @override
  List<Object?> get props => [customerId];
}

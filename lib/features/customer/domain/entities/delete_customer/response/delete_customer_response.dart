import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_customer_response.g.dart';

@JsonSerializable(createToJson: false)
class DeleteCustomerResponse extends Equatable {
  final bool success;

  factory DeleteCustomerResponse.fromJson(Map<String, dynamic> data) =>
      _$DeleteCustomerResponseFromJson(data);

  const DeleteCustomerResponse(this.success);

  @override
  List<Object?> get props => [success];
}

import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_customers_params.g.dart';

@JsonSerializable(createFactory: false)
class GetCustomersParams extends Equatable {


Map<String,dynamic> toJson() =>  _$GetCustomersParamsToJson(this);

@override

List<Object?> get props => [];
}

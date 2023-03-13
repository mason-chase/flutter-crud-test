import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/error/failure.dart';
import '../../../domain/entities/create_customer/response/create_customer_response.dart';

part 'state.freezed.dart';

@freezed
class CreateCustomerState with _$CreateCustomerState {
  const factory CreateCustomerState.initial() = _CreateCustomerStateInital;
  const factory CreateCustomerState.loading() = CreateCustomerStateLoading;
  const factory CreateCustomerState.done(
      CreateCustomerResponse response) = _CreateCustomerStateLoaded;
  const factory CreateCustomerState.error(Failure failure) =
      _CreateCustomerStateError;
}

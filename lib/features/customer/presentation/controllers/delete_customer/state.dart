import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/error/failure.dart';
import '../../../domain/entities/delete_customer/response/delete_customer_response.dart';

part 'state.freezed.dart';

@freezed
class DeleteCustomerState with _$DeleteCustomerState {
  const factory DeleteCustomerState.initial() = _DeleteCustomerStateInital;
  const factory DeleteCustomerState.loading() = DeleteCustomerStateLoading;
  const factory DeleteCustomerState.done(DeleteCustomerResponse response) =
      _DeleteCustomerStateLoaded;
  const factory DeleteCustomerState.error(Failure failure) =
      _DeleteCustomerStateError;
}

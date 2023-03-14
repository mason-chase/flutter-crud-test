import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mc_crud_test/features/customer/domain/entities/update_customer/response/update_customer_response.dart';

import '../../../../../core/error/failure.dart';
import '../../../domain/entities/delete_customer/response/delete_customer_response.dart';

part 'state.freezed.dart';

@freezed
class UpdateCustomerState with _$UpdateCustomerState {
  const factory UpdateCustomerState.initial() = _UpdateCustomerStateInital;
  const factory UpdateCustomerState.loading() = UpdateCustomerStateLoading;
  const factory UpdateCustomerState.done(UpdateCustomerResponse response) =
      _UpdateCustomerStateLoaded;
  const factory UpdateCustomerState.error(Failure failure) =
      _UpdateCustomerStateError;
}

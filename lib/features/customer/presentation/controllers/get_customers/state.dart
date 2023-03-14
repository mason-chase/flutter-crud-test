import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/error/failure.dart';
import '../../../domain/entities/get_customers/response/get_customers_response.dart';

part 'state.freezed.dart';

@freezed
class GetCustomersState with _$GetCustomersState {
  const factory GetCustomersState.initial() = _GetCustomersStateInital;
  const factory GetCustomersState.loading() = GetCustomersStateLoading;
  const factory GetCustomersState.done(GetCustomersResponse response) =
      _GetCustomersStateLoaded;
  const factory GetCustomersState.error(Failure failure) =
      _GetCustomersStateError;
}

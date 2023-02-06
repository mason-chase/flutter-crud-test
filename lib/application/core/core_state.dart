import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mc_crud_test/domain/core/failure/core_failure.dart';

part 'core_state.freezed.dart';

@freezed
class CoreState<T> with _$CoreState<T> {
  const factory CoreState.initial() = CoreStateInitial;

  const factory CoreState.loadInProgress() = LoadInProgress;

  const factory CoreState.fetchDataFailure({
    required CoreFailure dataFailure,
  }) = FetchDataFailure;

  const factory CoreState.fetchDataSuccessfully({
    required T data,
  }) = FetchDataSuccessfully<T>;
}

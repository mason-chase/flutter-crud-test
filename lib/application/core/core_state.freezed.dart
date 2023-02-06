// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'core_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CoreState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function(CoreFailure dataFailure) fetchDataFailure,
    required TResult Function(T data) fetchDataSuccessfully,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadInProgress,
    TResult? Function(CoreFailure dataFailure)? fetchDataFailure,
    TResult? Function(T data)? fetchDataSuccessfully,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(CoreFailure dataFailure)? fetchDataFailure,
    TResult Function(T data)? fetchDataSuccessfully,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CoreStateInitial<T> value) initial,
    required TResult Function(LoadInProgress<T> value) loadInProgress,
    required TResult Function(FetchDataFailure<T> value) fetchDataFailure,
    required TResult Function(FetchDataSuccessfully<T> value)
        fetchDataSuccessfully,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CoreStateInitial<T> value)? initial,
    TResult? Function(LoadInProgress<T> value)? loadInProgress,
    TResult? Function(FetchDataFailure<T> value)? fetchDataFailure,
    TResult? Function(FetchDataSuccessfully<T> value)? fetchDataSuccessfully,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CoreStateInitial<T> value)? initial,
    TResult Function(LoadInProgress<T> value)? loadInProgress,
    TResult Function(FetchDataFailure<T> value)? fetchDataFailure,
    TResult Function(FetchDataSuccessfully<T> value)? fetchDataSuccessfully,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoreStateCopyWith<T, $Res> {
  factory $CoreStateCopyWith(
          CoreState<T> value, $Res Function(CoreState<T>) then) =
      _$CoreStateCopyWithImpl<T, $Res, CoreState<T>>;
}

/// @nodoc
class _$CoreStateCopyWithImpl<T, $Res, $Val extends CoreState<T>>
    implements $CoreStateCopyWith<T, $Res> {
  _$CoreStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$CoreStateInitialCopyWith<T, $Res> {
  factory _$$CoreStateInitialCopyWith(_$CoreStateInitial<T> value,
          $Res Function(_$CoreStateInitial<T>) then) =
      __$$CoreStateInitialCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$CoreStateInitialCopyWithImpl<T, $Res>
    extends _$CoreStateCopyWithImpl<T, $Res, _$CoreStateInitial<T>>
    implements _$$CoreStateInitialCopyWith<T, $Res> {
  __$$CoreStateInitialCopyWithImpl(
      _$CoreStateInitial<T> _value, $Res Function(_$CoreStateInitial<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CoreStateInitial<T> implements CoreStateInitial<T> {
  const _$CoreStateInitial();

  @override
  String toString() {
    return 'CoreState<$T>.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CoreStateInitial<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function(CoreFailure dataFailure) fetchDataFailure,
    required TResult Function(T data) fetchDataSuccessfully,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadInProgress,
    TResult? Function(CoreFailure dataFailure)? fetchDataFailure,
    TResult? Function(T data)? fetchDataSuccessfully,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(CoreFailure dataFailure)? fetchDataFailure,
    TResult Function(T data)? fetchDataSuccessfully,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CoreStateInitial<T> value) initial,
    required TResult Function(LoadInProgress<T> value) loadInProgress,
    required TResult Function(FetchDataFailure<T> value) fetchDataFailure,
    required TResult Function(FetchDataSuccessfully<T> value)
        fetchDataSuccessfully,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CoreStateInitial<T> value)? initial,
    TResult? Function(LoadInProgress<T> value)? loadInProgress,
    TResult? Function(FetchDataFailure<T> value)? fetchDataFailure,
    TResult? Function(FetchDataSuccessfully<T> value)? fetchDataSuccessfully,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CoreStateInitial<T> value)? initial,
    TResult Function(LoadInProgress<T> value)? loadInProgress,
    TResult Function(FetchDataFailure<T> value)? fetchDataFailure,
    TResult Function(FetchDataSuccessfully<T> value)? fetchDataSuccessfully,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class CoreStateInitial<T> implements CoreState<T> {
  const factory CoreStateInitial() = _$CoreStateInitial<T>;
}

/// @nodoc
abstract class _$$LoadInProgressCopyWith<T, $Res> {
  factory _$$LoadInProgressCopyWith(
          _$LoadInProgress<T> value, $Res Function(_$LoadInProgress<T>) then) =
      __$$LoadInProgressCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$LoadInProgressCopyWithImpl<T, $Res>
    extends _$CoreStateCopyWithImpl<T, $Res, _$LoadInProgress<T>>
    implements _$$LoadInProgressCopyWith<T, $Res> {
  __$$LoadInProgressCopyWithImpl(
      _$LoadInProgress<T> _value, $Res Function(_$LoadInProgress<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadInProgress<T> implements LoadInProgress<T> {
  const _$LoadInProgress();

  @override
  String toString() {
    return 'CoreState<$T>.loadInProgress()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadInProgress<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function(CoreFailure dataFailure) fetchDataFailure,
    required TResult Function(T data) fetchDataSuccessfully,
  }) {
    return loadInProgress();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadInProgress,
    TResult? Function(CoreFailure dataFailure)? fetchDataFailure,
    TResult? Function(T data)? fetchDataSuccessfully,
  }) {
    return loadInProgress?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(CoreFailure dataFailure)? fetchDataFailure,
    TResult Function(T data)? fetchDataSuccessfully,
    required TResult orElse(),
  }) {
    if (loadInProgress != null) {
      return loadInProgress();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CoreStateInitial<T> value) initial,
    required TResult Function(LoadInProgress<T> value) loadInProgress,
    required TResult Function(FetchDataFailure<T> value) fetchDataFailure,
    required TResult Function(FetchDataSuccessfully<T> value)
        fetchDataSuccessfully,
  }) {
    return loadInProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CoreStateInitial<T> value)? initial,
    TResult? Function(LoadInProgress<T> value)? loadInProgress,
    TResult? Function(FetchDataFailure<T> value)? fetchDataFailure,
    TResult? Function(FetchDataSuccessfully<T> value)? fetchDataSuccessfully,
  }) {
    return loadInProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CoreStateInitial<T> value)? initial,
    TResult Function(LoadInProgress<T> value)? loadInProgress,
    TResult Function(FetchDataFailure<T> value)? fetchDataFailure,
    TResult Function(FetchDataSuccessfully<T> value)? fetchDataSuccessfully,
    required TResult orElse(),
  }) {
    if (loadInProgress != null) {
      return loadInProgress(this);
    }
    return orElse();
  }
}

abstract class LoadInProgress<T> implements CoreState<T> {
  const factory LoadInProgress() = _$LoadInProgress<T>;
}

/// @nodoc
abstract class _$$FetchDataFailureCopyWith<T, $Res> {
  factory _$$FetchDataFailureCopyWith(_$FetchDataFailure<T> value,
          $Res Function(_$FetchDataFailure<T>) then) =
      __$$FetchDataFailureCopyWithImpl<T, $Res>;
  @useResult
  $Res call({CoreFailure dataFailure});

  $CoreFailureCopyWith<$Res> get dataFailure;
}

/// @nodoc
class __$$FetchDataFailureCopyWithImpl<T, $Res>
    extends _$CoreStateCopyWithImpl<T, $Res, _$FetchDataFailure<T>>
    implements _$$FetchDataFailureCopyWith<T, $Res> {
  __$$FetchDataFailureCopyWithImpl(
      _$FetchDataFailure<T> _value, $Res Function(_$FetchDataFailure<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dataFailure = null,
  }) {
    return _then(_$FetchDataFailure<T>(
      dataFailure: null == dataFailure
          ? _value.dataFailure
          : dataFailure // ignore: cast_nullable_to_non_nullable
              as CoreFailure,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $CoreFailureCopyWith<$Res> get dataFailure {
    return $CoreFailureCopyWith<$Res>(_value.dataFailure, (value) {
      return _then(_value.copyWith(dataFailure: value));
    });
  }
}

/// @nodoc

class _$FetchDataFailure<T> implements FetchDataFailure<T> {
  const _$FetchDataFailure({required this.dataFailure});

  @override
  final CoreFailure dataFailure;

  @override
  String toString() {
    return 'CoreState<$T>.fetchDataFailure(dataFailure: $dataFailure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchDataFailure<T> &&
            (identical(other.dataFailure, dataFailure) ||
                other.dataFailure == dataFailure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dataFailure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchDataFailureCopyWith<T, _$FetchDataFailure<T>> get copyWith =>
      __$$FetchDataFailureCopyWithImpl<T, _$FetchDataFailure<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function(CoreFailure dataFailure) fetchDataFailure,
    required TResult Function(T data) fetchDataSuccessfully,
  }) {
    return fetchDataFailure(dataFailure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadInProgress,
    TResult? Function(CoreFailure dataFailure)? fetchDataFailure,
    TResult? Function(T data)? fetchDataSuccessfully,
  }) {
    return fetchDataFailure?.call(dataFailure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(CoreFailure dataFailure)? fetchDataFailure,
    TResult Function(T data)? fetchDataSuccessfully,
    required TResult orElse(),
  }) {
    if (fetchDataFailure != null) {
      return fetchDataFailure(dataFailure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CoreStateInitial<T> value) initial,
    required TResult Function(LoadInProgress<T> value) loadInProgress,
    required TResult Function(FetchDataFailure<T> value) fetchDataFailure,
    required TResult Function(FetchDataSuccessfully<T> value)
        fetchDataSuccessfully,
  }) {
    return fetchDataFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CoreStateInitial<T> value)? initial,
    TResult? Function(LoadInProgress<T> value)? loadInProgress,
    TResult? Function(FetchDataFailure<T> value)? fetchDataFailure,
    TResult? Function(FetchDataSuccessfully<T> value)? fetchDataSuccessfully,
  }) {
    return fetchDataFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CoreStateInitial<T> value)? initial,
    TResult Function(LoadInProgress<T> value)? loadInProgress,
    TResult Function(FetchDataFailure<T> value)? fetchDataFailure,
    TResult Function(FetchDataSuccessfully<T> value)? fetchDataSuccessfully,
    required TResult orElse(),
  }) {
    if (fetchDataFailure != null) {
      return fetchDataFailure(this);
    }
    return orElse();
  }
}

abstract class FetchDataFailure<T> implements CoreState<T> {
  const factory FetchDataFailure({required final CoreFailure dataFailure}) =
      _$FetchDataFailure<T>;

  CoreFailure get dataFailure;
  @JsonKey(ignore: true)
  _$$FetchDataFailureCopyWith<T, _$FetchDataFailure<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchDataSuccessfullyCopyWith<T, $Res> {
  factory _$$FetchDataSuccessfullyCopyWith(_$FetchDataSuccessfully<T> value,
          $Res Function(_$FetchDataSuccessfully<T>) then) =
      __$$FetchDataSuccessfullyCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$FetchDataSuccessfullyCopyWithImpl<T, $Res>
    extends _$CoreStateCopyWithImpl<T, $Res, _$FetchDataSuccessfully<T>>
    implements _$$FetchDataSuccessfullyCopyWith<T, $Res> {
  __$$FetchDataSuccessfullyCopyWithImpl(_$FetchDataSuccessfully<T> _value,
      $Res Function(_$FetchDataSuccessfully<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$FetchDataSuccessfully<T>(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$FetchDataSuccessfully<T> implements FetchDataSuccessfully<T> {
  const _$FetchDataSuccessfully({required this.data});

  @override
  final T data;

  @override
  String toString() {
    return 'CoreState<$T>.fetchDataSuccessfully(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchDataSuccessfully<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchDataSuccessfullyCopyWith<T, _$FetchDataSuccessfully<T>>
      get copyWith =>
          __$$FetchDataSuccessfullyCopyWithImpl<T, _$FetchDataSuccessfully<T>>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function(CoreFailure dataFailure) fetchDataFailure,
    required TResult Function(T data) fetchDataSuccessfully,
  }) {
    return fetchDataSuccessfully(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadInProgress,
    TResult? Function(CoreFailure dataFailure)? fetchDataFailure,
    TResult? Function(T data)? fetchDataSuccessfully,
  }) {
    return fetchDataSuccessfully?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(CoreFailure dataFailure)? fetchDataFailure,
    TResult Function(T data)? fetchDataSuccessfully,
    required TResult orElse(),
  }) {
    if (fetchDataSuccessfully != null) {
      return fetchDataSuccessfully(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CoreStateInitial<T> value) initial,
    required TResult Function(LoadInProgress<T> value) loadInProgress,
    required TResult Function(FetchDataFailure<T> value) fetchDataFailure,
    required TResult Function(FetchDataSuccessfully<T> value)
        fetchDataSuccessfully,
  }) {
    return fetchDataSuccessfully(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CoreStateInitial<T> value)? initial,
    TResult? Function(LoadInProgress<T> value)? loadInProgress,
    TResult? Function(FetchDataFailure<T> value)? fetchDataFailure,
    TResult? Function(FetchDataSuccessfully<T> value)? fetchDataSuccessfully,
  }) {
    return fetchDataSuccessfully?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CoreStateInitial<T> value)? initial,
    TResult Function(LoadInProgress<T> value)? loadInProgress,
    TResult Function(FetchDataFailure<T> value)? fetchDataFailure,
    TResult Function(FetchDataSuccessfully<T> value)? fetchDataSuccessfully,
    required TResult orElse(),
  }) {
    if (fetchDataSuccessfully != null) {
      return fetchDataSuccessfully(this);
    }
    return orElse();
  }
}

abstract class FetchDataSuccessfully<T> implements CoreState<T> {
  const factory FetchDataSuccessfully({required final T data}) =
      _$FetchDataSuccessfully<T>;

  T get data;
  @JsonKey(ignore: true)
  _$$FetchDataSuccessfullyCopyWith<T, _$FetchDataSuccessfully<T>>
      get copyWith => throw _privateConstructorUsedError;
}

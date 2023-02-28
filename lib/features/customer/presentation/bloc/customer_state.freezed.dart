// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CustomerState {
  bool get isLoading => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isLoading) initial,
    required TResult Function(String message, bool isLoading) error,
    required TResult Function(Customer? data, bool isLoading) successGetById,
    required TResult Function(bool isLoading) successDeleted,
    required TResult Function(Customer data, bool isLoading) successAdded,
    required TResult Function(Customer data, bool isLoading) successEdited,
    required TResult Function(List<Customer> data, bool isLoading)
        successGetCustomers,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isLoading)? initial,
    TResult? Function(String message, bool isLoading)? error,
    TResult? Function(Customer? data, bool isLoading)? successGetById,
    TResult? Function(bool isLoading)? successDeleted,
    TResult? Function(Customer data, bool isLoading)? successAdded,
    TResult? Function(Customer data, bool isLoading)? successEdited,
    TResult? Function(List<Customer> data, bool isLoading)? successGetCustomers,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading)? initial,
    TResult Function(String message, bool isLoading)? error,
    TResult Function(Customer? data, bool isLoading)? successGetById,
    TResult Function(bool isLoading)? successDeleted,
    TResult Function(Customer data, bool isLoading)? successAdded,
    TResult Function(Customer data, bool isLoading)? successEdited,
    TResult Function(List<Customer> data, bool isLoading)? successGetCustomers,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CustomerInitial value) initial,
    required TResult Function(CustomerError value) error,
    required TResult Function(CustomerSuccessById value) successGetById,
    required TResult Function(CustomerSuccessDeleted value) successDeleted,
    required TResult Function(CustomerSuccessAdded value) successAdded,
    required TResult Function(CustomerSuccessEdited value) successEdited,
    required TResult Function(CustomerSuccess value) successGetCustomers,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CustomerInitial value)? initial,
    TResult? Function(CustomerError value)? error,
    TResult? Function(CustomerSuccessById value)? successGetById,
    TResult? Function(CustomerSuccessDeleted value)? successDeleted,
    TResult? Function(CustomerSuccessAdded value)? successAdded,
    TResult? Function(CustomerSuccessEdited value)? successEdited,
    TResult? Function(CustomerSuccess value)? successGetCustomers,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CustomerInitial value)? initial,
    TResult Function(CustomerError value)? error,
    TResult Function(CustomerSuccessById value)? successGetById,
    TResult Function(CustomerSuccessDeleted value)? successDeleted,
    TResult Function(CustomerSuccessAdded value)? successAdded,
    TResult Function(CustomerSuccessEdited value)? successEdited,
    TResult Function(CustomerSuccess value)? successGetCustomers,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CustomerStateCopyWith<CustomerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerStateCopyWith<$Res> {
  factory $CustomerStateCopyWith(
          CustomerState value, $Res Function(CustomerState) then) =
      _$CustomerStateCopyWithImpl<$Res, CustomerState>;
  @useResult
  $Res call({bool isLoading});
}

/// @nodoc
class _$CustomerStateCopyWithImpl<$Res, $Val extends CustomerState>
    implements $CustomerStateCopyWith<$Res> {
  _$CustomerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CustomerInitialCopyWith<$Res>
    implements $CustomerStateCopyWith<$Res> {
  factory _$$CustomerInitialCopyWith(
          _$CustomerInitial value, $Res Function(_$CustomerInitial) then) =
      __$$CustomerInitialCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading});
}

/// @nodoc
class __$$CustomerInitialCopyWithImpl<$Res>
    extends _$CustomerStateCopyWithImpl<$Res, _$CustomerInitial>
    implements _$$CustomerInitialCopyWith<$Res> {
  __$$CustomerInitialCopyWithImpl(
      _$CustomerInitial _value, $Res Function(_$CustomerInitial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
  }) {
    return _then(_$CustomerInitial(
      null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$CustomerInitial implements CustomerInitial {
  const _$CustomerInitial(this.isLoading);

  @override
  final bool isLoading;

  @override
  String toString() {
    return 'CustomerState.initial(isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerInitial &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerInitialCopyWith<_$CustomerInitial> get copyWith =>
      __$$CustomerInitialCopyWithImpl<_$CustomerInitial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isLoading) initial,
    required TResult Function(String message, bool isLoading) error,
    required TResult Function(Customer? data, bool isLoading) successGetById,
    required TResult Function(bool isLoading) successDeleted,
    required TResult Function(Customer data, bool isLoading) successAdded,
    required TResult Function(Customer data, bool isLoading) successEdited,
    required TResult Function(List<Customer> data, bool isLoading)
        successGetCustomers,
  }) {
    return initial(isLoading);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isLoading)? initial,
    TResult? Function(String message, bool isLoading)? error,
    TResult? Function(Customer? data, bool isLoading)? successGetById,
    TResult? Function(bool isLoading)? successDeleted,
    TResult? Function(Customer data, bool isLoading)? successAdded,
    TResult? Function(Customer data, bool isLoading)? successEdited,
    TResult? Function(List<Customer> data, bool isLoading)? successGetCustomers,
  }) {
    return initial?.call(isLoading);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading)? initial,
    TResult Function(String message, bool isLoading)? error,
    TResult Function(Customer? data, bool isLoading)? successGetById,
    TResult Function(bool isLoading)? successDeleted,
    TResult Function(Customer data, bool isLoading)? successAdded,
    TResult Function(Customer data, bool isLoading)? successEdited,
    TResult Function(List<Customer> data, bool isLoading)? successGetCustomers,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(isLoading);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CustomerInitial value) initial,
    required TResult Function(CustomerError value) error,
    required TResult Function(CustomerSuccessById value) successGetById,
    required TResult Function(CustomerSuccessDeleted value) successDeleted,
    required TResult Function(CustomerSuccessAdded value) successAdded,
    required TResult Function(CustomerSuccessEdited value) successEdited,
    required TResult Function(CustomerSuccess value) successGetCustomers,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CustomerInitial value)? initial,
    TResult? Function(CustomerError value)? error,
    TResult? Function(CustomerSuccessById value)? successGetById,
    TResult? Function(CustomerSuccessDeleted value)? successDeleted,
    TResult? Function(CustomerSuccessAdded value)? successAdded,
    TResult? Function(CustomerSuccessEdited value)? successEdited,
    TResult? Function(CustomerSuccess value)? successGetCustomers,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CustomerInitial value)? initial,
    TResult Function(CustomerError value)? error,
    TResult Function(CustomerSuccessById value)? successGetById,
    TResult Function(CustomerSuccessDeleted value)? successDeleted,
    TResult Function(CustomerSuccessAdded value)? successAdded,
    TResult Function(CustomerSuccessEdited value)? successEdited,
    TResult Function(CustomerSuccess value)? successGetCustomers,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class CustomerInitial implements CustomerState {
  const factory CustomerInitial(final bool isLoading) = _$CustomerInitial;

  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$CustomerInitialCopyWith<_$CustomerInitial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CustomerErrorCopyWith<$Res>
    implements $CustomerStateCopyWith<$Res> {
  factory _$$CustomerErrorCopyWith(
          _$CustomerError value, $Res Function(_$CustomerError) then) =
      __$$CustomerErrorCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, bool isLoading});
}

/// @nodoc
class __$$CustomerErrorCopyWithImpl<$Res>
    extends _$CustomerStateCopyWithImpl<$Res, _$CustomerError>
    implements _$$CustomerErrorCopyWith<$Res> {
  __$$CustomerErrorCopyWithImpl(
      _$CustomerError _value, $Res Function(_$CustomerError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? isLoading = null,
  }) {
    return _then(_$CustomerError(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$CustomerError implements CustomerError {
  const _$CustomerError(this.message, this.isLoading);

  @override
  final String message;
  @override
  final bool isLoading;

  @override
  String toString() {
    return 'CustomerState.error(message: $message, isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerError &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerErrorCopyWith<_$CustomerError> get copyWith =>
      __$$CustomerErrorCopyWithImpl<_$CustomerError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isLoading) initial,
    required TResult Function(String message, bool isLoading) error,
    required TResult Function(Customer? data, bool isLoading) successGetById,
    required TResult Function(bool isLoading) successDeleted,
    required TResult Function(Customer data, bool isLoading) successAdded,
    required TResult Function(Customer data, bool isLoading) successEdited,
    required TResult Function(List<Customer> data, bool isLoading)
        successGetCustomers,
  }) {
    return error(message, isLoading);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isLoading)? initial,
    TResult? Function(String message, bool isLoading)? error,
    TResult? Function(Customer? data, bool isLoading)? successGetById,
    TResult? Function(bool isLoading)? successDeleted,
    TResult? Function(Customer data, bool isLoading)? successAdded,
    TResult? Function(Customer data, bool isLoading)? successEdited,
    TResult? Function(List<Customer> data, bool isLoading)? successGetCustomers,
  }) {
    return error?.call(message, isLoading);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading)? initial,
    TResult Function(String message, bool isLoading)? error,
    TResult Function(Customer? data, bool isLoading)? successGetById,
    TResult Function(bool isLoading)? successDeleted,
    TResult Function(Customer data, bool isLoading)? successAdded,
    TResult Function(Customer data, bool isLoading)? successEdited,
    TResult Function(List<Customer> data, bool isLoading)? successGetCustomers,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message, isLoading);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CustomerInitial value) initial,
    required TResult Function(CustomerError value) error,
    required TResult Function(CustomerSuccessById value) successGetById,
    required TResult Function(CustomerSuccessDeleted value) successDeleted,
    required TResult Function(CustomerSuccessAdded value) successAdded,
    required TResult Function(CustomerSuccessEdited value) successEdited,
    required TResult Function(CustomerSuccess value) successGetCustomers,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CustomerInitial value)? initial,
    TResult? Function(CustomerError value)? error,
    TResult? Function(CustomerSuccessById value)? successGetById,
    TResult? Function(CustomerSuccessDeleted value)? successDeleted,
    TResult? Function(CustomerSuccessAdded value)? successAdded,
    TResult? Function(CustomerSuccessEdited value)? successEdited,
    TResult? Function(CustomerSuccess value)? successGetCustomers,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CustomerInitial value)? initial,
    TResult Function(CustomerError value)? error,
    TResult Function(CustomerSuccessById value)? successGetById,
    TResult Function(CustomerSuccessDeleted value)? successDeleted,
    TResult Function(CustomerSuccessAdded value)? successAdded,
    TResult Function(CustomerSuccessEdited value)? successEdited,
    TResult Function(CustomerSuccess value)? successGetCustomers,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class CustomerError implements CustomerState {
  const factory CustomerError(final String message, final bool isLoading) =
      _$CustomerError;

  String get message;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$CustomerErrorCopyWith<_$CustomerError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CustomerSuccessByIdCopyWith<$Res>
    implements $CustomerStateCopyWith<$Res> {
  factory _$$CustomerSuccessByIdCopyWith(_$CustomerSuccessById value,
          $Res Function(_$CustomerSuccessById) then) =
      __$$CustomerSuccessByIdCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Customer? data, bool isLoading});
}

/// @nodoc
class __$$CustomerSuccessByIdCopyWithImpl<$Res>
    extends _$CustomerStateCopyWithImpl<$Res, _$CustomerSuccessById>
    implements _$$CustomerSuccessByIdCopyWith<$Res> {
  __$$CustomerSuccessByIdCopyWithImpl(
      _$CustomerSuccessById _value, $Res Function(_$CustomerSuccessById) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? isLoading = null,
  }) {
    return _then(_$CustomerSuccessById(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Customer?,
      null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$CustomerSuccessById implements CustomerSuccessById {
  const _$CustomerSuccessById(this.data, this.isLoading);

  @override
  final Customer? data;
  @override
  final bool isLoading;

  @override
  String toString() {
    return 'CustomerState.successGetById(data: $data, isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerSuccessById &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data, isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerSuccessByIdCopyWith<_$CustomerSuccessById> get copyWith =>
      __$$CustomerSuccessByIdCopyWithImpl<_$CustomerSuccessById>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isLoading) initial,
    required TResult Function(String message, bool isLoading) error,
    required TResult Function(Customer? data, bool isLoading) successGetById,
    required TResult Function(bool isLoading) successDeleted,
    required TResult Function(Customer data, bool isLoading) successAdded,
    required TResult Function(Customer data, bool isLoading) successEdited,
    required TResult Function(List<Customer> data, bool isLoading)
        successGetCustomers,
  }) {
    return successGetById(data, isLoading);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isLoading)? initial,
    TResult? Function(String message, bool isLoading)? error,
    TResult? Function(Customer? data, bool isLoading)? successGetById,
    TResult? Function(bool isLoading)? successDeleted,
    TResult? Function(Customer data, bool isLoading)? successAdded,
    TResult? Function(Customer data, bool isLoading)? successEdited,
    TResult? Function(List<Customer> data, bool isLoading)? successGetCustomers,
  }) {
    return successGetById?.call(data, isLoading);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading)? initial,
    TResult Function(String message, bool isLoading)? error,
    TResult Function(Customer? data, bool isLoading)? successGetById,
    TResult Function(bool isLoading)? successDeleted,
    TResult Function(Customer data, bool isLoading)? successAdded,
    TResult Function(Customer data, bool isLoading)? successEdited,
    TResult Function(List<Customer> data, bool isLoading)? successGetCustomers,
    required TResult orElse(),
  }) {
    if (successGetById != null) {
      return successGetById(data, isLoading);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CustomerInitial value) initial,
    required TResult Function(CustomerError value) error,
    required TResult Function(CustomerSuccessById value) successGetById,
    required TResult Function(CustomerSuccessDeleted value) successDeleted,
    required TResult Function(CustomerSuccessAdded value) successAdded,
    required TResult Function(CustomerSuccessEdited value) successEdited,
    required TResult Function(CustomerSuccess value) successGetCustomers,
  }) {
    return successGetById(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CustomerInitial value)? initial,
    TResult? Function(CustomerError value)? error,
    TResult? Function(CustomerSuccessById value)? successGetById,
    TResult? Function(CustomerSuccessDeleted value)? successDeleted,
    TResult? Function(CustomerSuccessAdded value)? successAdded,
    TResult? Function(CustomerSuccessEdited value)? successEdited,
    TResult? Function(CustomerSuccess value)? successGetCustomers,
  }) {
    return successGetById?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CustomerInitial value)? initial,
    TResult Function(CustomerError value)? error,
    TResult Function(CustomerSuccessById value)? successGetById,
    TResult Function(CustomerSuccessDeleted value)? successDeleted,
    TResult Function(CustomerSuccessAdded value)? successAdded,
    TResult Function(CustomerSuccessEdited value)? successEdited,
    TResult Function(CustomerSuccess value)? successGetCustomers,
    required TResult orElse(),
  }) {
    if (successGetById != null) {
      return successGetById(this);
    }
    return orElse();
  }
}

abstract class CustomerSuccessById implements CustomerState {
  const factory CustomerSuccessById(
      final Customer? data, final bool isLoading) = _$CustomerSuccessById;

  Customer? get data;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$CustomerSuccessByIdCopyWith<_$CustomerSuccessById> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CustomerSuccessDeletedCopyWith<$Res>
    implements $CustomerStateCopyWith<$Res> {
  factory _$$CustomerSuccessDeletedCopyWith(_$CustomerSuccessDeleted value,
          $Res Function(_$CustomerSuccessDeleted) then) =
      __$$CustomerSuccessDeletedCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading});
}

/// @nodoc
class __$$CustomerSuccessDeletedCopyWithImpl<$Res>
    extends _$CustomerStateCopyWithImpl<$Res, _$CustomerSuccessDeleted>
    implements _$$CustomerSuccessDeletedCopyWith<$Res> {
  __$$CustomerSuccessDeletedCopyWithImpl(_$CustomerSuccessDeleted _value,
      $Res Function(_$CustomerSuccessDeleted) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
  }) {
    return _then(_$CustomerSuccessDeleted(
      null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$CustomerSuccessDeleted implements CustomerSuccessDeleted {
  const _$CustomerSuccessDeleted(this.isLoading);

  @override
  final bool isLoading;

  @override
  String toString() {
    return 'CustomerState.successDeleted(isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerSuccessDeleted &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerSuccessDeletedCopyWith<_$CustomerSuccessDeleted> get copyWith =>
      __$$CustomerSuccessDeletedCopyWithImpl<_$CustomerSuccessDeleted>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isLoading) initial,
    required TResult Function(String message, bool isLoading) error,
    required TResult Function(Customer? data, bool isLoading) successGetById,
    required TResult Function(bool isLoading) successDeleted,
    required TResult Function(Customer data, bool isLoading) successAdded,
    required TResult Function(Customer data, bool isLoading) successEdited,
    required TResult Function(List<Customer> data, bool isLoading)
        successGetCustomers,
  }) {
    return successDeleted(isLoading);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isLoading)? initial,
    TResult? Function(String message, bool isLoading)? error,
    TResult? Function(Customer? data, bool isLoading)? successGetById,
    TResult? Function(bool isLoading)? successDeleted,
    TResult? Function(Customer data, bool isLoading)? successAdded,
    TResult? Function(Customer data, bool isLoading)? successEdited,
    TResult? Function(List<Customer> data, bool isLoading)? successGetCustomers,
  }) {
    return successDeleted?.call(isLoading);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading)? initial,
    TResult Function(String message, bool isLoading)? error,
    TResult Function(Customer? data, bool isLoading)? successGetById,
    TResult Function(bool isLoading)? successDeleted,
    TResult Function(Customer data, bool isLoading)? successAdded,
    TResult Function(Customer data, bool isLoading)? successEdited,
    TResult Function(List<Customer> data, bool isLoading)? successGetCustomers,
    required TResult orElse(),
  }) {
    if (successDeleted != null) {
      return successDeleted(isLoading);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CustomerInitial value) initial,
    required TResult Function(CustomerError value) error,
    required TResult Function(CustomerSuccessById value) successGetById,
    required TResult Function(CustomerSuccessDeleted value) successDeleted,
    required TResult Function(CustomerSuccessAdded value) successAdded,
    required TResult Function(CustomerSuccessEdited value) successEdited,
    required TResult Function(CustomerSuccess value) successGetCustomers,
  }) {
    return successDeleted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CustomerInitial value)? initial,
    TResult? Function(CustomerError value)? error,
    TResult? Function(CustomerSuccessById value)? successGetById,
    TResult? Function(CustomerSuccessDeleted value)? successDeleted,
    TResult? Function(CustomerSuccessAdded value)? successAdded,
    TResult? Function(CustomerSuccessEdited value)? successEdited,
    TResult? Function(CustomerSuccess value)? successGetCustomers,
  }) {
    return successDeleted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CustomerInitial value)? initial,
    TResult Function(CustomerError value)? error,
    TResult Function(CustomerSuccessById value)? successGetById,
    TResult Function(CustomerSuccessDeleted value)? successDeleted,
    TResult Function(CustomerSuccessAdded value)? successAdded,
    TResult Function(CustomerSuccessEdited value)? successEdited,
    TResult Function(CustomerSuccess value)? successGetCustomers,
    required TResult orElse(),
  }) {
    if (successDeleted != null) {
      return successDeleted(this);
    }
    return orElse();
  }
}

abstract class CustomerSuccessDeleted implements CustomerState {
  const factory CustomerSuccessDeleted(final bool isLoading) =
      _$CustomerSuccessDeleted;

  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$CustomerSuccessDeletedCopyWith<_$CustomerSuccessDeleted> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CustomerSuccessAddedCopyWith<$Res>
    implements $CustomerStateCopyWith<$Res> {
  factory _$$CustomerSuccessAddedCopyWith(_$CustomerSuccessAdded value,
          $Res Function(_$CustomerSuccessAdded) then) =
      __$$CustomerSuccessAddedCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Customer data, bool isLoading});
}

/// @nodoc
class __$$CustomerSuccessAddedCopyWithImpl<$Res>
    extends _$CustomerStateCopyWithImpl<$Res, _$CustomerSuccessAdded>
    implements _$$CustomerSuccessAddedCopyWith<$Res> {
  __$$CustomerSuccessAddedCopyWithImpl(_$CustomerSuccessAdded _value,
      $Res Function(_$CustomerSuccessAdded) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? isLoading = null,
  }) {
    return _then(_$CustomerSuccessAdded(
      null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Customer,
      null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$CustomerSuccessAdded implements CustomerSuccessAdded {
  const _$CustomerSuccessAdded(this.data, this.isLoading);

  @override
  final Customer data;
  @override
  final bool isLoading;

  @override
  String toString() {
    return 'CustomerState.successAdded(data: $data, isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerSuccessAdded &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data, isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerSuccessAddedCopyWith<_$CustomerSuccessAdded> get copyWith =>
      __$$CustomerSuccessAddedCopyWithImpl<_$CustomerSuccessAdded>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isLoading) initial,
    required TResult Function(String message, bool isLoading) error,
    required TResult Function(Customer? data, bool isLoading) successGetById,
    required TResult Function(bool isLoading) successDeleted,
    required TResult Function(Customer data, bool isLoading) successAdded,
    required TResult Function(Customer data, bool isLoading) successEdited,
    required TResult Function(List<Customer> data, bool isLoading)
        successGetCustomers,
  }) {
    return successAdded(data, isLoading);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isLoading)? initial,
    TResult? Function(String message, bool isLoading)? error,
    TResult? Function(Customer? data, bool isLoading)? successGetById,
    TResult? Function(bool isLoading)? successDeleted,
    TResult? Function(Customer data, bool isLoading)? successAdded,
    TResult? Function(Customer data, bool isLoading)? successEdited,
    TResult? Function(List<Customer> data, bool isLoading)? successGetCustomers,
  }) {
    return successAdded?.call(data, isLoading);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading)? initial,
    TResult Function(String message, bool isLoading)? error,
    TResult Function(Customer? data, bool isLoading)? successGetById,
    TResult Function(bool isLoading)? successDeleted,
    TResult Function(Customer data, bool isLoading)? successAdded,
    TResult Function(Customer data, bool isLoading)? successEdited,
    TResult Function(List<Customer> data, bool isLoading)? successGetCustomers,
    required TResult orElse(),
  }) {
    if (successAdded != null) {
      return successAdded(data, isLoading);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CustomerInitial value) initial,
    required TResult Function(CustomerError value) error,
    required TResult Function(CustomerSuccessById value) successGetById,
    required TResult Function(CustomerSuccessDeleted value) successDeleted,
    required TResult Function(CustomerSuccessAdded value) successAdded,
    required TResult Function(CustomerSuccessEdited value) successEdited,
    required TResult Function(CustomerSuccess value) successGetCustomers,
  }) {
    return successAdded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CustomerInitial value)? initial,
    TResult? Function(CustomerError value)? error,
    TResult? Function(CustomerSuccessById value)? successGetById,
    TResult? Function(CustomerSuccessDeleted value)? successDeleted,
    TResult? Function(CustomerSuccessAdded value)? successAdded,
    TResult? Function(CustomerSuccessEdited value)? successEdited,
    TResult? Function(CustomerSuccess value)? successGetCustomers,
  }) {
    return successAdded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CustomerInitial value)? initial,
    TResult Function(CustomerError value)? error,
    TResult Function(CustomerSuccessById value)? successGetById,
    TResult Function(CustomerSuccessDeleted value)? successDeleted,
    TResult Function(CustomerSuccessAdded value)? successAdded,
    TResult Function(CustomerSuccessEdited value)? successEdited,
    TResult Function(CustomerSuccess value)? successGetCustomers,
    required TResult orElse(),
  }) {
    if (successAdded != null) {
      return successAdded(this);
    }
    return orElse();
  }
}

abstract class CustomerSuccessAdded implements CustomerState {
  const factory CustomerSuccessAdded(
      final Customer data, final bool isLoading) = _$CustomerSuccessAdded;

  Customer get data;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$CustomerSuccessAddedCopyWith<_$CustomerSuccessAdded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CustomerSuccessEditedCopyWith<$Res>
    implements $CustomerStateCopyWith<$Res> {
  factory _$$CustomerSuccessEditedCopyWith(_$CustomerSuccessEdited value,
          $Res Function(_$CustomerSuccessEdited) then) =
      __$$CustomerSuccessEditedCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Customer data, bool isLoading});
}

/// @nodoc
class __$$CustomerSuccessEditedCopyWithImpl<$Res>
    extends _$CustomerStateCopyWithImpl<$Res, _$CustomerSuccessEdited>
    implements _$$CustomerSuccessEditedCopyWith<$Res> {
  __$$CustomerSuccessEditedCopyWithImpl(_$CustomerSuccessEdited _value,
      $Res Function(_$CustomerSuccessEdited) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? isLoading = null,
  }) {
    return _then(_$CustomerSuccessEdited(
      null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Customer,
      null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$CustomerSuccessEdited implements CustomerSuccessEdited {
  const _$CustomerSuccessEdited(this.data, this.isLoading);

  @override
  final Customer data;
  @override
  final bool isLoading;

  @override
  String toString() {
    return 'CustomerState.successEdited(data: $data, isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerSuccessEdited &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data, isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerSuccessEditedCopyWith<_$CustomerSuccessEdited> get copyWith =>
      __$$CustomerSuccessEditedCopyWithImpl<_$CustomerSuccessEdited>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isLoading) initial,
    required TResult Function(String message, bool isLoading) error,
    required TResult Function(Customer? data, bool isLoading) successGetById,
    required TResult Function(bool isLoading) successDeleted,
    required TResult Function(Customer data, bool isLoading) successAdded,
    required TResult Function(Customer data, bool isLoading) successEdited,
    required TResult Function(List<Customer> data, bool isLoading)
        successGetCustomers,
  }) {
    return successEdited(data, isLoading);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isLoading)? initial,
    TResult? Function(String message, bool isLoading)? error,
    TResult? Function(Customer? data, bool isLoading)? successGetById,
    TResult? Function(bool isLoading)? successDeleted,
    TResult? Function(Customer data, bool isLoading)? successAdded,
    TResult? Function(Customer data, bool isLoading)? successEdited,
    TResult? Function(List<Customer> data, bool isLoading)? successGetCustomers,
  }) {
    return successEdited?.call(data, isLoading);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading)? initial,
    TResult Function(String message, bool isLoading)? error,
    TResult Function(Customer? data, bool isLoading)? successGetById,
    TResult Function(bool isLoading)? successDeleted,
    TResult Function(Customer data, bool isLoading)? successAdded,
    TResult Function(Customer data, bool isLoading)? successEdited,
    TResult Function(List<Customer> data, bool isLoading)? successGetCustomers,
    required TResult orElse(),
  }) {
    if (successEdited != null) {
      return successEdited(data, isLoading);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CustomerInitial value) initial,
    required TResult Function(CustomerError value) error,
    required TResult Function(CustomerSuccessById value) successGetById,
    required TResult Function(CustomerSuccessDeleted value) successDeleted,
    required TResult Function(CustomerSuccessAdded value) successAdded,
    required TResult Function(CustomerSuccessEdited value) successEdited,
    required TResult Function(CustomerSuccess value) successGetCustomers,
  }) {
    return successEdited(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CustomerInitial value)? initial,
    TResult? Function(CustomerError value)? error,
    TResult? Function(CustomerSuccessById value)? successGetById,
    TResult? Function(CustomerSuccessDeleted value)? successDeleted,
    TResult? Function(CustomerSuccessAdded value)? successAdded,
    TResult? Function(CustomerSuccessEdited value)? successEdited,
    TResult? Function(CustomerSuccess value)? successGetCustomers,
  }) {
    return successEdited?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CustomerInitial value)? initial,
    TResult Function(CustomerError value)? error,
    TResult Function(CustomerSuccessById value)? successGetById,
    TResult Function(CustomerSuccessDeleted value)? successDeleted,
    TResult Function(CustomerSuccessAdded value)? successAdded,
    TResult Function(CustomerSuccessEdited value)? successEdited,
    TResult Function(CustomerSuccess value)? successGetCustomers,
    required TResult orElse(),
  }) {
    if (successEdited != null) {
      return successEdited(this);
    }
    return orElse();
  }
}

abstract class CustomerSuccessEdited implements CustomerState {
  const factory CustomerSuccessEdited(
      final Customer data, final bool isLoading) = _$CustomerSuccessEdited;

  Customer get data;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$CustomerSuccessEditedCopyWith<_$CustomerSuccessEdited> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CustomerSuccessCopyWith<$Res>
    implements $CustomerStateCopyWith<$Res> {
  factory _$$CustomerSuccessCopyWith(
          _$CustomerSuccess value, $Res Function(_$CustomerSuccess) then) =
      __$$CustomerSuccessCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Customer> data, bool isLoading});
}

/// @nodoc
class __$$CustomerSuccessCopyWithImpl<$Res>
    extends _$CustomerStateCopyWithImpl<$Res, _$CustomerSuccess>
    implements _$$CustomerSuccessCopyWith<$Res> {
  __$$CustomerSuccessCopyWithImpl(
      _$CustomerSuccess _value, $Res Function(_$CustomerSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? isLoading = null,
  }) {
    return _then(_$CustomerSuccess(
      null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Customer>,
      null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$CustomerSuccess implements CustomerSuccess {
  const _$CustomerSuccess(final List<Customer> data, this.isLoading)
      : _data = data;

  final List<Customer> _data;
  @override
  List<Customer> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  final bool isLoading;

  @override
  String toString() {
    return 'CustomerState.successGetCustomers(data: $data, isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerSuccess &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_data), isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerSuccessCopyWith<_$CustomerSuccess> get copyWith =>
      __$$CustomerSuccessCopyWithImpl<_$CustomerSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isLoading) initial,
    required TResult Function(String message, bool isLoading) error,
    required TResult Function(Customer? data, bool isLoading) successGetById,
    required TResult Function(bool isLoading) successDeleted,
    required TResult Function(Customer data, bool isLoading) successAdded,
    required TResult Function(Customer data, bool isLoading) successEdited,
    required TResult Function(List<Customer> data, bool isLoading)
        successGetCustomers,
  }) {
    return successGetCustomers(data, isLoading);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isLoading)? initial,
    TResult? Function(String message, bool isLoading)? error,
    TResult? Function(Customer? data, bool isLoading)? successGetById,
    TResult? Function(bool isLoading)? successDeleted,
    TResult? Function(Customer data, bool isLoading)? successAdded,
    TResult? Function(Customer data, bool isLoading)? successEdited,
    TResult? Function(List<Customer> data, bool isLoading)? successGetCustomers,
  }) {
    return successGetCustomers?.call(data, isLoading);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading)? initial,
    TResult Function(String message, bool isLoading)? error,
    TResult Function(Customer? data, bool isLoading)? successGetById,
    TResult Function(bool isLoading)? successDeleted,
    TResult Function(Customer data, bool isLoading)? successAdded,
    TResult Function(Customer data, bool isLoading)? successEdited,
    TResult Function(List<Customer> data, bool isLoading)? successGetCustomers,
    required TResult orElse(),
  }) {
    if (successGetCustomers != null) {
      return successGetCustomers(data, isLoading);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CustomerInitial value) initial,
    required TResult Function(CustomerError value) error,
    required TResult Function(CustomerSuccessById value) successGetById,
    required TResult Function(CustomerSuccessDeleted value) successDeleted,
    required TResult Function(CustomerSuccessAdded value) successAdded,
    required TResult Function(CustomerSuccessEdited value) successEdited,
    required TResult Function(CustomerSuccess value) successGetCustomers,
  }) {
    return successGetCustomers(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CustomerInitial value)? initial,
    TResult? Function(CustomerError value)? error,
    TResult? Function(CustomerSuccessById value)? successGetById,
    TResult? Function(CustomerSuccessDeleted value)? successDeleted,
    TResult? Function(CustomerSuccessAdded value)? successAdded,
    TResult? Function(CustomerSuccessEdited value)? successEdited,
    TResult? Function(CustomerSuccess value)? successGetCustomers,
  }) {
    return successGetCustomers?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CustomerInitial value)? initial,
    TResult Function(CustomerError value)? error,
    TResult Function(CustomerSuccessById value)? successGetById,
    TResult Function(CustomerSuccessDeleted value)? successDeleted,
    TResult Function(CustomerSuccessAdded value)? successAdded,
    TResult Function(CustomerSuccessEdited value)? successEdited,
    TResult Function(CustomerSuccess value)? successGetCustomers,
    required TResult orElse(),
  }) {
    if (successGetCustomers != null) {
      return successGetCustomers(this);
    }
    return orElse();
  }
}

abstract class CustomerSuccess implements CustomerState {
  const factory CustomerSuccess(
      final List<Customer> data, final bool isLoading) = _$CustomerSuccess;

  List<Customer> get data;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$CustomerSuccessCopyWith<_$CustomerSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

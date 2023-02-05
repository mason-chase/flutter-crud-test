// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ValueFailure<T> {
  T get failedValue => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T failedValue) emptyField,
    required TResult Function(T failedValue, int max) exceedingLength,
    required TResult Function(T failedValue) invalidPhoneNumber,
    required TResult Function(T failedValue) invalidEmail,
    required TResult Function(T failedValue) invalidOtpCode,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T failedValue)? emptyField,
    TResult? Function(T failedValue, int max)? exceedingLength,
    TResult? Function(T failedValue)? invalidPhoneNumber,
    TResult? Function(T failedValue)? invalidEmail,
    TResult? Function(T failedValue)? invalidOtpCode,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T failedValue)? emptyField,
    TResult Function(T failedValue, int max)? exceedingLength,
    TResult Function(T failedValue)? invalidPhoneNumber,
    TResult Function(T failedValue)? invalidEmail,
    TResult Function(T failedValue)? invalidOtpCode,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmptyField<T> value) emptyField,
    required TResult Function(ExceedingLength<T> value) exceedingLength,
    required TResult Function(InvalidPhoneNumber<T> value) invalidPhoneNumber,
    required TResult Function(InvalidEmail<T> value) invalidEmail,
    required TResult Function(InvalidOtpCode<T> value) invalidOtpCode,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmptyField<T> value)? emptyField,
    TResult? Function(ExceedingLength<T> value)? exceedingLength,
    TResult? Function(InvalidPhoneNumber<T> value)? invalidPhoneNumber,
    TResult? Function(InvalidEmail<T> value)? invalidEmail,
    TResult? Function(InvalidOtpCode<T> value)? invalidOtpCode,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmptyField<T> value)? emptyField,
    TResult Function(ExceedingLength<T> value)? exceedingLength,
    TResult Function(InvalidPhoneNumber<T> value)? invalidPhoneNumber,
    TResult Function(InvalidEmail<T> value)? invalidEmail,
    TResult Function(InvalidOtpCode<T> value)? invalidOtpCode,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ValueFailureCopyWith<T, ValueFailure<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ValueFailureCopyWith<T, $Res> {
  factory $ValueFailureCopyWith(
          ValueFailure<T> value, $Res Function(ValueFailure<T>) then) =
      _$ValueFailureCopyWithImpl<T, $Res, ValueFailure<T>>;
  @useResult
  $Res call({T failedValue});
}

/// @nodoc
class _$ValueFailureCopyWithImpl<T, $Res, $Val extends ValueFailure<T>>
    implements $ValueFailureCopyWith<T, $Res> {
  _$ValueFailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failedValue = freezed,
  }) {
    return _then(_value.copyWith(
      failedValue: freezed == failedValue
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as T,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EmptyFieldCopyWith<T, $Res>
    implements $ValueFailureCopyWith<T, $Res> {
  factory _$$EmptyFieldCopyWith(
          _$EmptyField<T> value, $Res Function(_$EmptyField<T>) then) =
      __$$EmptyFieldCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({T failedValue});
}

/// @nodoc
class __$$EmptyFieldCopyWithImpl<T, $Res>
    extends _$ValueFailureCopyWithImpl<T, $Res, _$EmptyField<T>>
    implements _$$EmptyFieldCopyWith<T, $Res> {
  __$$EmptyFieldCopyWithImpl(
      _$EmptyField<T> _value, $Res Function(_$EmptyField<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failedValue = freezed,
  }) {
    return _then(_$EmptyField<T>(
      failedValue: freezed == failedValue
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$EmptyField<T> with DiagnosticableTreeMixin implements EmptyField<T> {
  const _$EmptyField({required this.failedValue});

  @override
  final T failedValue;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ValueFailure<$T>.emptyField(failedValue: $failedValue)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ValueFailure<$T>.emptyField'))
      ..add(DiagnosticsProperty('failedValue', failedValue));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmptyField<T> &&
            const DeepCollectionEquality()
                .equals(other.failedValue, failedValue));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(failedValue));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EmptyFieldCopyWith<T, _$EmptyField<T>> get copyWith =>
      __$$EmptyFieldCopyWithImpl<T, _$EmptyField<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T failedValue) emptyField,
    required TResult Function(T failedValue, int max) exceedingLength,
    required TResult Function(T failedValue) invalidPhoneNumber,
    required TResult Function(T failedValue) invalidEmail,
    required TResult Function(T failedValue) invalidOtpCode,
  }) {
    return emptyField(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T failedValue)? emptyField,
    TResult? Function(T failedValue, int max)? exceedingLength,
    TResult? Function(T failedValue)? invalidPhoneNumber,
    TResult? Function(T failedValue)? invalidEmail,
    TResult? Function(T failedValue)? invalidOtpCode,
  }) {
    return emptyField?.call(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T failedValue)? emptyField,
    TResult Function(T failedValue, int max)? exceedingLength,
    TResult Function(T failedValue)? invalidPhoneNumber,
    TResult Function(T failedValue)? invalidEmail,
    TResult Function(T failedValue)? invalidOtpCode,
    required TResult orElse(),
  }) {
    if (emptyField != null) {
      return emptyField(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmptyField<T> value) emptyField,
    required TResult Function(ExceedingLength<T> value) exceedingLength,
    required TResult Function(InvalidPhoneNumber<T> value) invalidPhoneNumber,
    required TResult Function(InvalidEmail<T> value) invalidEmail,
    required TResult Function(InvalidOtpCode<T> value) invalidOtpCode,
  }) {
    return emptyField(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmptyField<T> value)? emptyField,
    TResult? Function(ExceedingLength<T> value)? exceedingLength,
    TResult? Function(InvalidPhoneNumber<T> value)? invalidPhoneNumber,
    TResult? Function(InvalidEmail<T> value)? invalidEmail,
    TResult? Function(InvalidOtpCode<T> value)? invalidOtpCode,
  }) {
    return emptyField?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmptyField<T> value)? emptyField,
    TResult Function(ExceedingLength<T> value)? exceedingLength,
    TResult Function(InvalidPhoneNumber<T> value)? invalidPhoneNumber,
    TResult Function(InvalidEmail<T> value)? invalidEmail,
    TResult Function(InvalidOtpCode<T> value)? invalidOtpCode,
    required TResult orElse(),
  }) {
    if (emptyField != null) {
      return emptyField(this);
    }
    return orElse();
  }
}

abstract class EmptyField<T> implements ValueFailure<T> {
  const factory EmptyField({required final T failedValue}) = _$EmptyField<T>;

  @override
  T get failedValue;
  @override
  @JsonKey(ignore: true)
  _$$EmptyFieldCopyWith<T, _$EmptyField<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ExceedingLengthCopyWith<T, $Res>
    implements $ValueFailureCopyWith<T, $Res> {
  factory _$$ExceedingLengthCopyWith(_$ExceedingLength<T> value,
          $Res Function(_$ExceedingLength<T>) then) =
      __$$ExceedingLengthCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({T failedValue, int max});
}

/// @nodoc
class __$$ExceedingLengthCopyWithImpl<T, $Res>
    extends _$ValueFailureCopyWithImpl<T, $Res, _$ExceedingLength<T>>
    implements _$$ExceedingLengthCopyWith<T, $Res> {
  __$$ExceedingLengthCopyWithImpl(
      _$ExceedingLength<T> _value, $Res Function(_$ExceedingLength<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failedValue = freezed,
    Object? max = null,
  }) {
    return _then(_$ExceedingLength<T>(
      failedValue: freezed == failedValue
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as T,
      max: null == max
          ? _value.max
          : max // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ExceedingLength<T>
    with DiagnosticableTreeMixin
    implements ExceedingLength<T> {
  const _$ExceedingLength({required this.failedValue, required this.max});

  @override
  final T failedValue;
  @override
  final int max;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ValueFailure<$T>.exceedingLength(failedValue: $failedValue, max: $max)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ValueFailure<$T>.exceedingLength'))
      ..add(DiagnosticsProperty('failedValue', failedValue))
      ..add(DiagnosticsProperty('max', max));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExceedingLength<T> &&
            const DeepCollectionEquality()
                .equals(other.failedValue, failedValue) &&
            (identical(other.max, max) || other.max == max));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(failedValue), max);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ExceedingLengthCopyWith<T, _$ExceedingLength<T>> get copyWith =>
      __$$ExceedingLengthCopyWithImpl<T, _$ExceedingLength<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T failedValue) emptyField,
    required TResult Function(T failedValue, int max) exceedingLength,
    required TResult Function(T failedValue) invalidPhoneNumber,
    required TResult Function(T failedValue) invalidEmail,
    required TResult Function(T failedValue) invalidOtpCode,
  }) {
    return exceedingLength(failedValue, max);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T failedValue)? emptyField,
    TResult? Function(T failedValue, int max)? exceedingLength,
    TResult? Function(T failedValue)? invalidPhoneNumber,
    TResult? Function(T failedValue)? invalidEmail,
    TResult? Function(T failedValue)? invalidOtpCode,
  }) {
    return exceedingLength?.call(failedValue, max);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T failedValue)? emptyField,
    TResult Function(T failedValue, int max)? exceedingLength,
    TResult Function(T failedValue)? invalidPhoneNumber,
    TResult Function(T failedValue)? invalidEmail,
    TResult Function(T failedValue)? invalidOtpCode,
    required TResult orElse(),
  }) {
    if (exceedingLength != null) {
      return exceedingLength(failedValue, max);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmptyField<T> value) emptyField,
    required TResult Function(ExceedingLength<T> value) exceedingLength,
    required TResult Function(InvalidPhoneNumber<T> value) invalidPhoneNumber,
    required TResult Function(InvalidEmail<T> value) invalidEmail,
    required TResult Function(InvalidOtpCode<T> value) invalidOtpCode,
  }) {
    return exceedingLength(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmptyField<T> value)? emptyField,
    TResult? Function(ExceedingLength<T> value)? exceedingLength,
    TResult? Function(InvalidPhoneNumber<T> value)? invalidPhoneNumber,
    TResult? Function(InvalidEmail<T> value)? invalidEmail,
    TResult? Function(InvalidOtpCode<T> value)? invalidOtpCode,
  }) {
    return exceedingLength?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmptyField<T> value)? emptyField,
    TResult Function(ExceedingLength<T> value)? exceedingLength,
    TResult Function(InvalidPhoneNumber<T> value)? invalidPhoneNumber,
    TResult Function(InvalidEmail<T> value)? invalidEmail,
    TResult Function(InvalidOtpCode<T> value)? invalidOtpCode,
    required TResult orElse(),
  }) {
    if (exceedingLength != null) {
      return exceedingLength(this);
    }
    return orElse();
  }
}

abstract class ExceedingLength<T> implements ValueFailure<T> {
  const factory ExceedingLength(
      {required final T failedValue,
      required final int max}) = _$ExceedingLength<T>;

  @override
  T get failedValue;
  int get max;
  @override
  @JsonKey(ignore: true)
  _$$ExceedingLengthCopyWith<T, _$ExceedingLength<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InvalidPhoneNumberCopyWith<T, $Res>
    implements $ValueFailureCopyWith<T, $Res> {
  factory _$$InvalidPhoneNumberCopyWith(_$InvalidPhoneNumber<T> value,
          $Res Function(_$InvalidPhoneNumber<T>) then) =
      __$$InvalidPhoneNumberCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({T failedValue});
}

/// @nodoc
class __$$InvalidPhoneNumberCopyWithImpl<T, $Res>
    extends _$ValueFailureCopyWithImpl<T, $Res, _$InvalidPhoneNumber<T>>
    implements _$$InvalidPhoneNumberCopyWith<T, $Res> {
  __$$InvalidPhoneNumberCopyWithImpl(_$InvalidPhoneNumber<T> _value,
      $Res Function(_$InvalidPhoneNumber<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failedValue = freezed,
  }) {
    return _then(_$InvalidPhoneNumber<T>(
      failedValue: freezed == failedValue
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$InvalidPhoneNumber<T>
    with DiagnosticableTreeMixin
    implements InvalidPhoneNumber<T> {
  const _$InvalidPhoneNumber({required this.failedValue});

  @override
  final T failedValue;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ValueFailure<$T>.invalidPhoneNumber(failedValue: $failedValue)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ValueFailure<$T>.invalidPhoneNumber'))
      ..add(DiagnosticsProperty('failedValue', failedValue));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvalidPhoneNumber<T> &&
            const DeepCollectionEquality()
                .equals(other.failedValue, failedValue));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(failedValue));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InvalidPhoneNumberCopyWith<T, _$InvalidPhoneNumber<T>> get copyWith =>
      __$$InvalidPhoneNumberCopyWithImpl<T, _$InvalidPhoneNumber<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T failedValue) emptyField,
    required TResult Function(T failedValue, int max) exceedingLength,
    required TResult Function(T failedValue) invalidPhoneNumber,
    required TResult Function(T failedValue) invalidEmail,
    required TResult Function(T failedValue) invalidOtpCode,
  }) {
    return invalidPhoneNumber(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T failedValue)? emptyField,
    TResult? Function(T failedValue, int max)? exceedingLength,
    TResult? Function(T failedValue)? invalidPhoneNumber,
    TResult? Function(T failedValue)? invalidEmail,
    TResult? Function(T failedValue)? invalidOtpCode,
  }) {
    return invalidPhoneNumber?.call(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T failedValue)? emptyField,
    TResult Function(T failedValue, int max)? exceedingLength,
    TResult Function(T failedValue)? invalidPhoneNumber,
    TResult Function(T failedValue)? invalidEmail,
    TResult Function(T failedValue)? invalidOtpCode,
    required TResult orElse(),
  }) {
    if (invalidPhoneNumber != null) {
      return invalidPhoneNumber(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmptyField<T> value) emptyField,
    required TResult Function(ExceedingLength<T> value) exceedingLength,
    required TResult Function(InvalidPhoneNumber<T> value) invalidPhoneNumber,
    required TResult Function(InvalidEmail<T> value) invalidEmail,
    required TResult Function(InvalidOtpCode<T> value) invalidOtpCode,
  }) {
    return invalidPhoneNumber(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmptyField<T> value)? emptyField,
    TResult? Function(ExceedingLength<T> value)? exceedingLength,
    TResult? Function(InvalidPhoneNumber<T> value)? invalidPhoneNumber,
    TResult? Function(InvalidEmail<T> value)? invalidEmail,
    TResult? Function(InvalidOtpCode<T> value)? invalidOtpCode,
  }) {
    return invalidPhoneNumber?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmptyField<T> value)? emptyField,
    TResult Function(ExceedingLength<T> value)? exceedingLength,
    TResult Function(InvalidPhoneNumber<T> value)? invalidPhoneNumber,
    TResult Function(InvalidEmail<T> value)? invalidEmail,
    TResult Function(InvalidOtpCode<T> value)? invalidOtpCode,
    required TResult orElse(),
  }) {
    if (invalidPhoneNumber != null) {
      return invalidPhoneNumber(this);
    }
    return orElse();
  }
}

abstract class InvalidPhoneNumber<T> implements ValueFailure<T> {
  const factory InvalidPhoneNumber({required final T failedValue}) =
      _$InvalidPhoneNumber<T>;

  @override
  T get failedValue;
  @override
  @JsonKey(ignore: true)
  _$$InvalidPhoneNumberCopyWith<T, _$InvalidPhoneNumber<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InvalidEmailCopyWith<T, $Res>
    implements $ValueFailureCopyWith<T, $Res> {
  factory _$$InvalidEmailCopyWith(
          _$InvalidEmail<T> value, $Res Function(_$InvalidEmail<T>) then) =
      __$$InvalidEmailCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({T failedValue});
}

/// @nodoc
class __$$InvalidEmailCopyWithImpl<T, $Res>
    extends _$ValueFailureCopyWithImpl<T, $Res, _$InvalidEmail<T>>
    implements _$$InvalidEmailCopyWith<T, $Res> {
  __$$InvalidEmailCopyWithImpl(
      _$InvalidEmail<T> _value, $Res Function(_$InvalidEmail<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failedValue = freezed,
  }) {
    return _then(_$InvalidEmail<T>(
      failedValue: freezed == failedValue
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$InvalidEmail<T>
    with DiagnosticableTreeMixin
    implements InvalidEmail<T> {
  const _$InvalidEmail({required this.failedValue});

  @override
  final T failedValue;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ValueFailure<$T>.invalidEmail(failedValue: $failedValue)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ValueFailure<$T>.invalidEmail'))
      ..add(DiagnosticsProperty('failedValue', failedValue));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvalidEmail<T> &&
            const DeepCollectionEquality()
                .equals(other.failedValue, failedValue));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(failedValue));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InvalidEmailCopyWith<T, _$InvalidEmail<T>> get copyWith =>
      __$$InvalidEmailCopyWithImpl<T, _$InvalidEmail<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T failedValue) emptyField,
    required TResult Function(T failedValue, int max) exceedingLength,
    required TResult Function(T failedValue) invalidPhoneNumber,
    required TResult Function(T failedValue) invalidEmail,
    required TResult Function(T failedValue) invalidOtpCode,
  }) {
    return invalidEmail(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T failedValue)? emptyField,
    TResult? Function(T failedValue, int max)? exceedingLength,
    TResult? Function(T failedValue)? invalidPhoneNumber,
    TResult? Function(T failedValue)? invalidEmail,
    TResult? Function(T failedValue)? invalidOtpCode,
  }) {
    return invalidEmail?.call(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T failedValue)? emptyField,
    TResult Function(T failedValue, int max)? exceedingLength,
    TResult Function(T failedValue)? invalidPhoneNumber,
    TResult Function(T failedValue)? invalidEmail,
    TResult Function(T failedValue)? invalidOtpCode,
    required TResult orElse(),
  }) {
    if (invalidEmail != null) {
      return invalidEmail(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmptyField<T> value) emptyField,
    required TResult Function(ExceedingLength<T> value) exceedingLength,
    required TResult Function(InvalidPhoneNumber<T> value) invalidPhoneNumber,
    required TResult Function(InvalidEmail<T> value) invalidEmail,
    required TResult Function(InvalidOtpCode<T> value) invalidOtpCode,
  }) {
    return invalidEmail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmptyField<T> value)? emptyField,
    TResult? Function(ExceedingLength<T> value)? exceedingLength,
    TResult? Function(InvalidPhoneNumber<T> value)? invalidPhoneNumber,
    TResult? Function(InvalidEmail<T> value)? invalidEmail,
    TResult? Function(InvalidOtpCode<T> value)? invalidOtpCode,
  }) {
    return invalidEmail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmptyField<T> value)? emptyField,
    TResult Function(ExceedingLength<T> value)? exceedingLength,
    TResult Function(InvalidPhoneNumber<T> value)? invalidPhoneNumber,
    TResult Function(InvalidEmail<T> value)? invalidEmail,
    TResult Function(InvalidOtpCode<T> value)? invalidOtpCode,
    required TResult orElse(),
  }) {
    if (invalidEmail != null) {
      return invalidEmail(this);
    }
    return orElse();
  }
}

abstract class InvalidEmail<T> implements ValueFailure<T> {
  const factory InvalidEmail({required final T failedValue}) =
      _$InvalidEmail<T>;

  @override
  T get failedValue;
  @override
  @JsonKey(ignore: true)
  _$$InvalidEmailCopyWith<T, _$InvalidEmail<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InvalidOtpCodeCopyWith<T, $Res>
    implements $ValueFailureCopyWith<T, $Res> {
  factory _$$InvalidOtpCodeCopyWith(
          _$InvalidOtpCode<T> value, $Res Function(_$InvalidOtpCode<T>) then) =
      __$$InvalidOtpCodeCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({T failedValue});
}

/// @nodoc
class __$$InvalidOtpCodeCopyWithImpl<T, $Res>
    extends _$ValueFailureCopyWithImpl<T, $Res, _$InvalidOtpCode<T>>
    implements _$$InvalidOtpCodeCopyWith<T, $Res> {
  __$$InvalidOtpCodeCopyWithImpl(
      _$InvalidOtpCode<T> _value, $Res Function(_$InvalidOtpCode<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failedValue = freezed,
  }) {
    return _then(_$InvalidOtpCode<T>(
      failedValue: freezed == failedValue
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$InvalidOtpCode<T>
    with DiagnosticableTreeMixin
    implements InvalidOtpCode<T> {
  const _$InvalidOtpCode({required this.failedValue});

  @override
  final T failedValue;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ValueFailure<$T>.invalidOtpCode(failedValue: $failedValue)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ValueFailure<$T>.invalidOtpCode'))
      ..add(DiagnosticsProperty('failedValue', failedValue));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvalidOtpCode<T> &&
            const DeepCollectionEquality()
                .equals(other.failedValue, failedValue));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(failedValue));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InvalidOtpCodeCopyWith<T, _$InvalidOtpCode<T>> get copyWith =>
      __$$InvalidOtpCodeCopyWithImpl<T, _$InvalidOtpCode<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T failedValue) emptyField,
    required TResult Function(T failedValue, int max) exceedingLength,
    required TResult Function(T failedValue) invalidPhoneNumber,
    required TResult Function(T failedValue) invalidEmail,
    required TResult Function(T failedValue) invalidOtpCode,
  }) {
    return invalidOtpCode(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T failedValue)? emptyField,
    TResult? Function(T failedValue, int max)? exceedingLength,
    TResult? Function(T failedValue)? invalidPhoneNumber,
    TResult? Function(T failedValue)? invalidEmail,
    TResult? Function(T failedValue)? invalidOtpCode,
  }) {
    return invalidOtpCode?.call(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T failedValue)? emptyField,
    TResult Function(T failedValue, int max)? exceedingLength,
    TResult Function(T failedValue)? invalidPhoneNumber,
    TResult Function(T failedValue)? invalidEmail,
    TResult Function(T failedValue)? invalidOtpCode,
    required TResult orElse(),
  }) {
    if (invalidOtpCode != null) {
      return invalidOtpCode(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmptyField<T> value) emptyField,
    required TResult Function(ExceedingLength<T> value) exceedingLength,
    required TResult Function(InvalidPhoneNumber<T> value) invalidPhoneNumber,
    required TResult Function(InvalidEmail<T> value) invalidEmail,
    required TResult Function(InvalidOtpCode<T> value) invalidOtpCode,
  }) {
    return invalidOtpCode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmptyField<T> value)? emptyField,
    TResult? Function(ExceedingLength<T> value)? exceedingLength,
    TResult? Function(InvalidPhoneNumber<T> value)? invalidPhoneNumber,
    TResult? Function(InvalidEmail<T> value)? invalidEmail,
    TResult? Function(InvalidOtpCode<T> value)? invalidOtpCode,
  }) {
    return invalidOtpCode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmptyField<T> value)? emptyField,
    TResult Function(ExceedingLength<T> value)? exceedingLength,
    TResult Function(InvalidPhoneNumber<T> value)? invalidPhoneNumber,
    TResult Function(InvalidEmail<T> value)? invalidEmail,
    TResult Function(InvalidOtpCode<T> value)? invalidOtpCode,
    required TResult orElse(),
  }) {
    if (invalidOtpCode != null) {
      return invalidOtpCode(this);
    }
    return orElse();
  }
}

abstract class InvalidOtpCode<T> implements ValueFailure<T> {
  const factory InvalidOtpCode({required final T failedValue}) =
      _$InvalidOtpCode<T>;

  @override
  T get failedValue;
  @override
  @JsonKey(ignore: true)
  _$$InvalidOtpCodeCopyWith<T, _$InvalidOtpCode<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

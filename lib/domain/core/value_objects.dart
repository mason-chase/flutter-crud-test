import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:mc_crud_test/domain/core/value_validators.dart';
import 'errors.dart';
import 'failure/failures.dart';

@immutable
abstract class ValueObject<T> {
  const ValueObject();

  Either<ValueFailure<String>, T> get value;

  /// Throws [UnexpectedValueError] containing the [ValueFailure]
  T getOrCrash() {
    // id = identity - same as writing (right) => right
    return value.fold((f) => throw UnexpectedValueError(f), id);
  }

  T getOrElse(T dflt) {
    //getOrElse age moshkeli pish nayad khode right ro barmigardoone
    //vali age fail beshe mire too anonymus function vali farghesh ine ke
    //to be failure dastresi nadari too in method
    //vali too fold() to ham be left ham be right dastresi dari
    return value.getOrElse(() => dflt);
  }

  //in method vase ine ke ma type valuFailure ro ignore konim chon age ke dar halate left bood
  //ma valueFailure<dynamic> barmigardoonim
  //va chon methode andThen() rooye Either kar mikone in mthod ham bayad Either bargardoone mese khode
  //value asli ke Either has
  Either<ValueFailure<dynamic>, Unit> get failureOrUnit {
    return value.fold(
      (l) => left(l),
      (r) => right(unit),
    );
  }

  bool isValid() {
    //isRight yani samte raste Either ke bakhshe dorost has yani fail nashode
    //vase hamin isRight yani ke valid has data
    return value.isRight();
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ValueObject<T> && other.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'Value($value)';
}

class PhoneNumber extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  const PhoneNumber._(this.value);

  factory PhoneNumber(String input) {
    return PhoneNumber._(validatePhoneNumber(input.trim()));
  }

  String? get phoneNumberError => value.fold(
        (failure) => failure.maybeMap(
          invalidPhoneNumber: (_) => "Your phone number invalid.",
          orElse: () => null,
        ),
        (_) => null,
      );
}

class Email extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  const Email._(this.value);

  factory Email(String input) {
    return Email._(validateEmailAddress(input.trim()));
  }

  String? get emailError => value.fold(
        (f) => f.maybeMap(
          invalidEmail: (_) => "Your email address invalid",
          orElse: () => null,
        ),
        (_) => null,
      );
}

class MandatoryValue extends ValueObject<String> {
  static const maxLength = 50;
  @override
  final Either<ValueFailure<String>, String> value;

  const MandatoryValue._(this.value);

  factory MandatoryValue(String input) {
    final data = input.trim();
    return MandatoryValue._(
      validateNotEmptyData(data).flatMap(
        (value) => validateMaxStringLength(data, maxLength: maxLength),
      ),
    );
  }

  String? mandatoryValueError({required String fieldName}) => value.fold(
        (f) => f.maybeMap(
          emptyField: (_) => "$fieldName not be empty",
          exceedingLength: (exceedingLength) => "$fieldName must have $exceedingLength charectar",
          orElse: () => null,
        ),
        (_) => null,
      );
}

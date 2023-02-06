import 'package:dartz/dartz.dart';

import 'failure/failures.dart';

Either<ValueFailure<String>, String> validateNotEmptyData(String input) {
  if (input.isEmpty) {
    return left(ValueFailure.emptyField(failedValue: input));
  }
  return right(input);
}

Either<ValueFailure<String>, String> validateMaxStringLength(String input,
    {required int maxLength}) {
  if (input.length <= maxLength) {
    return right(input);
  } else {
    return left(
      ValueFailure.exceedingLength(failedValue: input, max: maxLength),
    );
  }
}

Either<ValueFailure<String>, String> validateBankAccountNumber(String input) {
  final trimmedBankAccount = input.replaceAll("-", "");
  if (trimmedBankAccount.length != 16) {
    return left(ValueFailure.invalidBankAccountNumber(failedValue: input));
  }
  return right(input);
}

Either<ValueFailure<String>, String> validateEmailAddress(String input) {
  const emailRegex = r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";
  if (input.isNotEmpty && RegExp(emailRegex).hasMatch(input)) {
    return right(input);
  } else {
    return left(ValueFailure.invalidEmail(failedValue: input));
  }
}

Either<ValueFailure<String>, String> validatePhoneNumber(String input) {
  const phoneRegex = r"""^(?:[+0][1-9])?[0-9]{10,12}$""";
  if (input.isNotEmpty && RegExp(phoneRegex).hasMatch(input)) {
    return right(input);
  } else {
    return left(ValueFailure.invalidPhoneNumber(failedValue: input));
  }
}

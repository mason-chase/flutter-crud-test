import 'failure/failures.dart';

class UnexpectedValueError extends Error {
  final ValueFailure valueFailure;

  UnexpectedValueError(this.valueFailure);

  @override
  String toString() {
    const explanation = 'UnExpected Error was happend';
    return Error.safeToString('$explanation Failure was: $valueFailure');
  }
}

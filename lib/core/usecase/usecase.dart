import 'package:dartz/dartz.dart';

import '../error/failure.dart';

abstract class UseCases<T, Params> {
  Future<Either<Failure, T>> call(Params params);
}

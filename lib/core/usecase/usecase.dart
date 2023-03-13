import 'package:dartz/dartz.dart';

import '../failure/failure.dart';

abstract class UseCases<T, Params> {
  Future<Either<Failure, T>> call(Params params);
}

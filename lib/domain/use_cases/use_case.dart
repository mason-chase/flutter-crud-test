import 'package:dartz/dartz.dart';

import '../../shared_library/infrastructure/utils/failure.dart';

abstract class UseCase<R, P> {
  Future<Either<Failure, R>> call(final P params);
}

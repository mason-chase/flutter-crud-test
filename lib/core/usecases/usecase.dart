import 'package:dartz/dartz.dart';
import 'package:mc_crud_test/core/error/failures.dart';

abstract class UseCase<Response, Params> {
  Future<Either<Failure, Response>> call({required Params params});
}

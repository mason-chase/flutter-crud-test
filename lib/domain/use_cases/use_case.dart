import 'package:dartz/dartz.dart';

abstract class UseCase<R, P> {
  Future<Either<Exception, R>> call({final P? params});
}

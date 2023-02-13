import 'package:dartz/dartz.dart';

import '../../../data/repositories_impl/customer_repository_impl.dart';
import '../../../shared_library/infrastructure/utils/failure.dart';
import '../../entities/customer_entity.dart';
import '../use_case.dart';

class GetAllCustomersUseCase extends UseCase<List<CustomerEntity>, int> {
  final CustomerRepositoryImpl _repositoryImpl = CustomerRepositoryImpl();

  @override
  Future<Either<Failure, List<CustomerEntity>>> call({final int? params}) =>
      _repositoryImpl.getAllCustomers();
}

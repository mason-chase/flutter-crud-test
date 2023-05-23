import 'package:dartz/dartz.dart';

import '../../../data/repositories_impl/customer_repository_impl.dart';
import '../../entities/customer_entity.dart';
import '../../repositories/customer_repository.dart';
import '../use_case.dart';

class GetCustomerByIdUseCase extends UseCase<CustomerEntity, String> {
  final CustomerRepository _repository = CustomerRepositoryImpl();

  @override
  Future<Either<Exception, CustomerEntity>> call({final String? params}) =>
      _repository.getCustomerById(params!);
}

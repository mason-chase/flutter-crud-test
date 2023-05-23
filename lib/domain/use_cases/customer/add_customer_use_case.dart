import 'package:dartz/dartz.dart';

import '../../../data/dtos/customer/customer_dto.dart';
import '../../../data/repositories_impl/customer_repository_impl.dart';
import '../../entities/customer_entity.dart';
import '../../repositories/customer_repository.dart';
import '../use_case.dart';

class AddCustomerUseCase extends UseCase<CustomerEntity, CustomerDto> {
  final CustomerRepository _repository = CustomerRepositoryImpl();

  @override
  Future<Either<Exception, CustomerEntity>> call({final CustomerDto? params}) =>
      _repository.addCustomer(params!);
}

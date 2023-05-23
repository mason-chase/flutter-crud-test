import 'package:dartz/dartz.dart';

import '../../../data/repositories_impl/customer_repository_impl.dart';
import '../../repositories/customer_repository.dart';
import '../use_case.dart';

class DeleteCustomerUseCase extends UseCase<String, String> {
  final CustomerRepository _repository = CustomerRepositoryImpl();

  @override
  Future<Either<Exception, String>> call({final String? params}) =>
      _repository.deleteCustomer(params!);
}

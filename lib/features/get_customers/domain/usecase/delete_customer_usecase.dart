import 'package:logger/logger.dart';
import 'package:mc_crud_test/core/data/data_source/local/customer_entity.dart';
import 'package:mc_crud_test/core/usecase/use_case.dart';
import 'package:mc_crud_test/features/get_customers/domain/repository/delete_customer_repository.dart';

import '../../../../core/resources/data_state.dart';

class DeleteCustomerUseCase extends UseCase<DataState<int>, CustomerEntity> {

  final DeleteCustomerRepository _deleteCustomerRepository;
  DeleteCustomerUseCase(this._deleteCustomerRepository);

  Logger logger = Logger(printer: PrettyPrinter());

  @override
  Future<DataState<int>> call(CustomerEntity params) {
    logger.d(params.email);
    return _deleteCustomerRepository.deleteCustomer(params);
  }
}
import 'package:mc_crud_test/core/data/data_source/local/customer_entity.dart';
import 'package:mc_crud_test/core/usecase/use_case.dart';
import 'package:mc_crud_test/features/customer_list/domain/repository/delete_customer_repository.dart';

import '../../../../core/resources/data_state.dart';

class DeleteCustomerUseCase extends UseCase<DataState<int>, CustomerEntity> {

  final DeleteCustomerRepository _deleteCustomerRepository;
  DeleteCustomerUseCase(this._deleteCustomerRepository);


  @override
  Future<DataState<int>> call(CustomerEntity params) {
    return _deleteCustomerRepository.deleteCustomer(params);
  }
}
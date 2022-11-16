
import 'package:mc_crud_test/core/data/data_source/local/customer_entity.dart';
import 'package:mc_crud_test/features/update_customer/domain/repository/update_customer_repository.dart';

import '../../../../core/resources/data_state.dart';
import '../../../../core/usecase/use_case.dart';

class UpdateCustomerUseCase extends UseCase<DataState<CustomerEntity>, CustomerEntity> {
  final UpdateCustomerRepository _updateCustomerRepository;

  UpdateCustomerUseCase(this._updateCustomerRepository);

  @override
  Future<DataState<CustomerEntity>> call(CustomerEntity params) {
    return _updateCustomerRepository.updateCustomer(params);
  }

}
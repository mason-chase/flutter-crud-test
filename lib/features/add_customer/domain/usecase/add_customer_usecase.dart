import 'package:mc_crud_test/features/add_customer/domain/repository/add_customer_repository.dart';

import '../../../../core/data/data_source/local/customer_entity.dart';
import '../../../../core/resources/data_state.dart';
import '../../../../core/usecase/use_case.dart';

class AddCustomerUseCase extends UseCase<DataState<CustomerEntity>, CustomerEntity> {

  final AddCustomerRepository _addCustomerRepository;
  AddCustomerUseCase(this._addCustomerRepository);

  @override
  Future<DataState<CustomerEntity>> call(CustomerEntity params) {
   return _addCustomerRepository.addCustomer(params);
  }

}
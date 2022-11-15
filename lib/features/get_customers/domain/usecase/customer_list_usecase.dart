import 'package:mc_crud_test/features/get_customers/domain/repository/customer_list_repository.dart';

import '../../../../core/data/data_source/local/customer_entity.dart';
import '../../../../core/resources/data_state.dart';
import '../../../../core/usecase/use_case.dart';

class GetCustomerListUseCase extends UseCase<DataState<List<CustomerEntity>>, NoParams> {
  final CustomerListRepository _customerListRepository;

  GetCustomerListUseCase(this._customerListRepository);

  @override
  Future<DataState<List<CustomerEntity>>> call(NoParams params) {
   return _customerListRepository.getAllCustomers();
  }

}

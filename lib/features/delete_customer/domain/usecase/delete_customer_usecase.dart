import 'package:mc_crud_test/core/usecase/use_case.dart';
import 'package:mc_crud_test/features/delete_customer/domain/repository/delete_customer_repository.dart';

import '../../../../core/resources/data_state.dart';

class DeleteCustomerUseCase extends UseCase<DataState<bool>, int> {

  final DeleteCustomerRepository _deleteCustomerRepository;
  DeleteCustomerUseCase(this._deleteCustomerRepository);


  @override
  Future<DataState<bool>> call(int params) {
    return _deleteCustomerRepository.deleteCustomer(params);
  }
}
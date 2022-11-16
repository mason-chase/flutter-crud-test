import 'package:mc_crud_test/core/data/data_source/local/customer_entity.dart';
import 'package:mc_crud_test/core/resources/data_state.dart';
import 'package:mc_crud_test/features/update_customer/domain/repository/update_customer_repository.dart';

import '../../../../core/data/data_source/local/customer_dao.dart';

class UpdateCustomerRepositoryImpl extends UpdateCustomerRepository {

  CustomerDao customerDao;
  UpdateCustomerRepositoryImpl(this.customerDao);

  @override
  Future<DataState<CustomerEntity>> updateCustomer(CustomerEntity customer) async {
    try {
      await customerDao.updateCustomer(customer);
      return DataSuccess(customer);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }

}
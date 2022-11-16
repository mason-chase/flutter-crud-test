
import 'package:mc_crud_test/core/data/data_source/local/customer_entity.dart';
import 'package:mc_crud_test/core/resources/data_state.dart';
import 'package:mc_crud_test/features/delete_customer/domain/repository/delete_customer_repository.dart';

import '../../../../core/data/data_source/local/customer_dao.dart';

class DeleteCustomerRepositoryImpl extends DeleteCustomerRepository {

  CustomerDao customerDao;
  DeleteCustomerRepositoryImpl(this.customerDao);

  @override
  Future<DataState<bool>> deleteCustomer(int customerId) async {
        try {
          await customerDao.deleteCustomer(customerId);
          return DataSuccess(true);
        } catch (e) {
          return DataFailed(e.toString());
        }
  }

}
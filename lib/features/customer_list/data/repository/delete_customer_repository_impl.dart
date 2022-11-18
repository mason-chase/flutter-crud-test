import 'package:mc_crud_test/core/data/data_source/local/customer_entity.dart';
import 'package:mc_crud_test/core/resources/data_state.dart';
import 'package:mc_crud_test/features/customer_list/domain/repository/delete_customer_repository.dart';
import 'package:mc_crud_test/locator.dart';

import '../../../../core/data/data_source/local/customer_dao.dart';
import '../../../../core/data/data_source/local/database.dart';

class DeleteCustomerRepositoryImpl extends DeleteCustomerRepository {
  CustomerDao customerDao;

  DeleteCustomerRepositoryImpl(this.customerDao);

  @override
  Future<DataState<int>> deleteCustomer(CustomerEntity customer) async {
    try {
      var count = await locator<AppDatabase>().database.delete('CustomerEntity',
          where: 'id = ?', whereArgs: [customer.id]);
      return DataSuccess(count);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }
}

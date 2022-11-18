import 'package:logger/logger.dart';
import 'package:mc_crud_test/core/data/data_source/local/customer_entity.dart';
import 'package:mc_crud_test/core/resources/data_state.dart';
import 'package:mc_crud_test/features/get_customers/domain/repository/delete_customer_repository.dart';
import 'package:mc_crud_test/locator.dart';

import '../../../../core/data/data_source/local/customer_dao.dart';
import '../../../../core/data/data_source/local/database.dart';

class DeleteCustomerRepositoryImpl extends DeleteCustomerRepository {
  CustomerDao customerDao;

  DeleteCustomerRepositoryImpl(this.customerDao);

  Logger logger = Logger(printer: PrettyPrinter());

  @override
  Future<DataState<int>> deleteCustomer(CustomerEntity customer) async {
    try {
      logger.d(customer.id);
      var count = await locator<AppDatabase>().database.delete('CustomerEntity',
          where: 'id = ?', whereArgs: [customer.id]);
      logger.d(count);
      return DataSuccess(count);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }
}

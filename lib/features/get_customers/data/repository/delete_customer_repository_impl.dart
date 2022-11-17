
import 'package:logger/logger.dart';
import 'package:mc_crud_test/core/data/data_source/local/customer_entity.dart';
import 'package:mc_crud_test/core/resources/data_state.dart';
import 'package:mc_crud_test/features/get_customers/domain/repository/delete_customer_repository.dart';

import '../../../../core/data/data_source/local/customer_dao.dart';

class DeleteCustomerRepositoryImpl extends DeleteCustomerRepository {

  CustomerDao customerDao;
  DeleteCustomerRepositoryImpl(this.customerDao);
  Logger logger = Logger(printer: PrettyPrinter());

  @override
  Future<DataState<int>> deleteCustomer(CustomerEntity customer) async {
        try {
          var deletedItem = await customerDao.deleteCustomer(customer.email!);
          logger.d(deletedItem);
          return DataSuccess(deletedItem);
        } catch (e) {
          return DataFailed(e.toString());
        }
  }

}
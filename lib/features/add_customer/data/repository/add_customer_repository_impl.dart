import 'package:mc_crud_test/core/data/data_source/local/customer_dao.dart';
import 'package:mc_crud_test/core/data/data_source/local/customer_entity.dart';
import 'package:mc_crud_test/core/resources/data_state.dart';
import 'package:mc_crud_test/features/add_customer/domain/repository/add_customer_repository.dart';
import 'package:mc_crud_test/features/get_customers/domain/repository/customer_list_repository.dart';

class AddCustomerRepositoryImpl extends AddCustomerRepository {

  CustomerDao customerDao;
  AddCustomerRepositoryImpl(this.customerDao);

  @override
  Future<void> addCustomer(CustomerEntity customer) async {
      try {
        await customerDao.insertCustomer(customer);
        // return DataSuccess(customer);
      } catch (e) {
        // return DataFailed(e.toString());
      }
  }



}

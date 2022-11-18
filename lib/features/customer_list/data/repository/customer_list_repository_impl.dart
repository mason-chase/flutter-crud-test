import 'package:mc_crud_test/core/data/data_source/local/customer_dao.dart';
import 'package:mc_crud_test/core/data/data_source/local/customer_entity.dart';
import 'package:mc_crud_test/core/resources/data_state.dart';
import 'package:mc_crud_test/features/customer_list/domain/repository/customer_list_repository.dart';

class CustomerListRepositoryImpl extends CustomerListRepository {

  CustomerDao customerDao;
  CustomerListRepositoryImpl(this.customerDao);


  @override
  Future<DataState<List<CustomerEntity>>> getAllCustomers() async {
    try {
       var customerList = await customerDao.getAll();
      return DataSuccess(customerList);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }


}

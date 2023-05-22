import '../../../../core/data/data_source/local/customer_entity.dart';
import '../../../../core/resources/data_state.dart';

abstract class DeleteCustomerRepository {

  Future<DataState<int>> deleteCustomer(CustomerEntity customer);
}
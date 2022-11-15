import 'package:mc_crud_test/core/resources/data_state.dart';

import '../../../../core/data/data_source/local/customer_entity.dart';

abstract class AddCustomerRepository{

  Future<DataState<CustomerEntity>> addCustomer(CustomerEntity customer);
}
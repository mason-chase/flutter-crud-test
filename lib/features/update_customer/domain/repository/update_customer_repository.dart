import 'package:mc_crud_test/core/data/data_source/local/customer_entity.dart';

import '../../../../core/resources/data_state.dart';

abstract class UpdateCustomerRepository{

  Future<DataState<CustomerEntity>> updateCustomer(CustomerEntity customer);
}
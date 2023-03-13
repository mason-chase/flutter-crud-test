import '../../domain/entities/get_customers/params/get_customers_params.dart';
import '../../domain/entities/get_customers/response/get_customers_response.dart';

import '../../domain/entities/create_customer/params/create_customer_params.dart';
import '../../domain/entities/create_customer/response/create_customer_response.dart';
import '../../domain/entities/delete_customer/params/delete_customer_params.dart';
import '../../domain/entities/delete_customer/response/delete_customer_response.dart';

///
/// Customer datasource class
///
abstract class CustomerDataSource {
  Future<CreateCustomerResponse> createCustomer(CreateCustomerParams params);
  Future<DeleteCustomerResponse> deleteCustomer(DeleteCustomerParams params);
  Future<GetCustomersResponse> getCustomers(GetCustomersParams params);
}

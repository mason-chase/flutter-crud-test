import '../../domain/entities/create_customer/params/create_customer_params.dart';
import '../../domain/entities/create_customer/response/create_customer_response.dart';


/// 
/// Customer datasource class 
///
abstract class CustomerDataSource {
  Future<CreateCustomerResponse> createCustomer(CreateCustomerParams params);
}

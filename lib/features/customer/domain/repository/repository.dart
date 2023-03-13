import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/create_customer/params/create_customer_params.dart';
import '../entities/create_customer/response/create_customer_response.dart';
import '../entities/delete_customer/params/delete_customer_params.dart';
import '../entities/delete_customer/response/delete_customer_response.dart';
import '../entities/get_customers/params/get_customers_params.dart';
import '../entities/get_customers/response/get_customers_response.dart';

///
/// Customer repository
abstract class CustomerRepository {
  /// Create customer
  Future<Either<Failure, CreateCustomerResponse>> createCustomer(
      CreateCustomerParams params);

  /// Get customers
  Future<Either<Failure, GetCustomersResponse>> getCustomers(
      GetCustomersParams params);

  /// Update customer
  /// Delete customer
  Future<Either<Failure, DeleteCustomerResponse>> deleteCustomer(
      DeleteCustomerParams params);
}

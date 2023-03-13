import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/create_customer/params/create_customer_params.dart';
import '../entities/create_customer/response/create_customer_response.dart';

///
/// Customer repository
abstract class CustomerRepository {
  /// Create customer
  Future<Either<Failure, CreateCustomerResponse>> createCustomer(
      CreateCustomerParams params);
  /// Get customers
  /// Update customer
  /// Delete customer
}

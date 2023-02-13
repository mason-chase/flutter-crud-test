import 'package:dartz/dartz.dart';

import '../../data/dtos/customer/customer_dto.dart';
import '../entities/customer_entity.dart';

abstract class CustomerRepository {
  Future<Either<Exception, CustomerEntity>> addCustomer(final CustomerDto dto);

  Future<Either<Exception, List<CustomerEntity>>> getAllCustomers();

  Future<Either<Exception, CustomerEntity>> editCustomer(final CustomerDto dto);

  Future<Either<Exception, CustomerEntity>> getCustomerById(final String id);

  Future<Either<Exception, String>> deleteCustomer(final String id);
}

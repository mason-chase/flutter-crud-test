import 'package:dartz/dartz.dart';
import 'package:mc_crud_test/core/customer/data/dto/customer_dto.dart';
import 'package:mc_crud_test/core/error/failures.dart';

abstract class CustomerRepository {
  Future<Either<Failure, List<CustomerDTO>>> getAllCustomers();
  Future<Either<Failure, CustomerDTO>> getCustomer(String firstName);
  Future<Either<Failure, String>> addCustomer(CustomerDTO data);
  Future<Either<Failure, String>> deleteCustomer(String firstName);
  Future<Either<Failure, String>> updateCustomer(CustomerDTO data);
}

import 'package:dartz/dartz.dart';
import 'package:mc_crud_test/core/customer/data/dto/customer_dto.dart';
import 'package:mc_crud_test/core/customer/data/repository/customer/customer_repository.dart';
import 'package:mc_crud_test/core/error/failures.dart';

abstract class CustomerRepositoryImpl extends CustomerRepository {
  @override
  Future<Either<Failure, List<CustomerDTO>>> getAllCustomers();
  @override
  Future<Either<Failure, CustomerDTO>> getCustomer(String firstName);
  @override
  Future<Either<Failure, String>> addCustomer(CustomerDTO data);
  @override
  Future<Either<Failure, String>> deleteCustomer(String firstName);
  @override
  Future<Either<Failure, String>> updateCustomer(CustomerDTO data);
}

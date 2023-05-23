import 'package:dartz/dartz.dart';
import 'package:mc_crud_test/core/error/failures.dart';
import 'package:mc_crud_test/features/customer/domain/entities/customer.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([CustomerRepository])
abstract class CustomerRepository {
  Future<Either<Failure, List<Customer>>> getCustomers();

  Future<Either<Failure, Customer?>> getCustomerById(String id);

  Future<Either<Failure, Customer>> addCustomer(Customer customer);

  Future<Either<Failure, Customer>> editCustomer(Customer customer);

  Future<Either<Failure, void>> deleteCustomer(String email);
}

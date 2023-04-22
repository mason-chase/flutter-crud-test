import 'package:dartz/dartz.dart';
import 'package:mc_crud_test/core/models/failure.dart';
import 'package:mc_crud_test/features/customer/domain/customer.entity.dart';

abstract class CustomerRepository {
  Future<Either<Failure, List<Customer>>> getCustomerList();
  Future<Either<Failure, void>> addCustomer(Customer customer);
}

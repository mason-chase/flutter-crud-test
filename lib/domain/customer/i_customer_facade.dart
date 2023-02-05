import 'package:dartz/dartz.dart';
import 'package:mc_crud_test/application/customer/add_customer/add_customer_bloc.dart';
import 'package:mc_crud_test/domain/core/failure/core_failure.dart';
import 'package:mc_crud_test/domain/customer/entity/customer_entity.dart';

abstract class ICustomerFacade {
  Future<Either<CoreFailure, List<CustomerEntity>>> getAllCustomer();

  Future<Either<CoreFailure, Unit>> addCustomer(AddCustomerState customer);

  Future<Either<CoreFailure, Unit>> updateCustomer(CustomerEntity customer);

  Future<Either<CoreFailure, Unit>> deleteCustomer();
}

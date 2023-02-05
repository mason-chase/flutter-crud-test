import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mc_crud_test/domain/core/failure/core_failure.dart';
import 'package:mc_crud_test/domain/customer/entity/customer_entity.dart';
import 'package:mc_crud_test/domain/customer/i_customer_facade.dart';

@LazySingleton(as: ICustomerFacade)
class CustomerFacade implements ICustomerFacade {
  CustomerFacade();

  @override
  Future<Either<CoreFailure, Unit>> addCustomer() {
    // TODO: implement addCustomer
    throw UnimplementedError();
  }

  @override
  Future<Either<CoreFailure, Unit>> deleteCustomer() {
    // TODO: implement deleteCustomer
    throw UnimplementedError();
  }

  @override
  Future<Either<CoreFailure, List<CustomerEntity>>> getAllCustomer() {
    // TODO: implement getAllCustomer
    throw UnimplementedError();
  }

  @override
  Future<Either<CoreFailure, Unit>> updateCustomer() {
    // TODO: implement updateCustomer
    throw UnimplementedError();
  }
}

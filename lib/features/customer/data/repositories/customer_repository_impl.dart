import 'package:dartz/dartz.dart';
import 'package:mc_crud_test/core/error/failures.dart';
import 'package:mc_crud_test/features/customer/domain/entities/customer.dart';
import 'package:mc_crud_test/features/customer/domain/repositories/customer_repository.dart';
import '../datasources/customer_local_data_source.dart';

class CustomerRepositoryImpl implements CustomerRepository {
  final CustomerLocalDataSource localDataSource;

  CustomerRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<Failure, Customer>> addCustomer(Customer customer) async {
    try {
      if ((await localDataSource.getCustomerById(customer.email)) != null) {
        return const Left(DatabaseFailure("Email is duplicate."));
      }
      return Right(await localDataSource.addCustomer(customer));
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteCustomer(String email) async {
    try {
      return Right(await localDataSource.deleteCustomer(email));
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Customer>> editCustomer(Customer customer) async {
    try {
      return Right(await localDataSource.editCustomer(customer));
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Customer?>> getCustomerById(String id) async {
    try {
      var result = await localDataSource.getCustomerById(id);
      if (result != null) {
        return Right(result);
      } else {
        return const Left(DatabaseFailure("User not found."));
      }
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Customer>>> getCustomers() async {
    try {
      return Right(await localDataSource.getCustomers());
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }
}

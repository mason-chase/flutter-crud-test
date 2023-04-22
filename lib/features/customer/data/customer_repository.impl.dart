import 'package:dartz/dartz.dart';
import 'package:mc_crud_test/app/app.database.dart';
import 'package:mc_crud_test/core/models/failure.dart';
import 'package:mc_crud_test/features/customer/domain/customer.entity.dart';
import 'package:mc_crud_test/features/customer/domain/customer.respository.dart';
import 'package:sqflite/sqflite.dart';

class CustomerRepositoryImpl implements CustomerRepository {
  final AppDatabase appDatabase;

  CustomerRepositoryImpl({required this.appDatabase});

  @override
  Future<Either<Failure, List<Customer>>> getCustomerList() async {
    try {
      final customers =
          await appDatabase.customerLocalDataSource.getCustomers();
      return Right(customers);
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> addCustomer(Customer customer) async {
    try {
      await appDatabase.customerLocalDataSource.addCustomer(customer);
      return right(unit);
    } on DatabaseException catch (_) {
      return left(const DatabaseFailure(
          'This customer with this information has already been added'));
    } catch (_) {
      return left(const DatabaseFailure('Something went wrong!!'));
    }
  }
}

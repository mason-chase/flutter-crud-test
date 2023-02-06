import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mc_crud_test/application/customer/add_customer/add_customer_bloc.dart';
import 'package:mc_crud_test/domain/core/failure/core_failure.dart';
import 'package:mc_crud_test/domain/customer/entity/customer_entity.dart';
import 'package:mc_crud_test/domain/customer/i_customer_facade.dart';
import 'package:mc_crud_test/infrastructure/database/database.dart';
import 'package:sqflite/sqflite.dart';

@LazySingleton(as: ICustomerFacade)
class CustomerFacade implements ICustomerFacade {
  final AppDatabase _dataBase;

  CustomerFacade(this._dataBase);

  @override
  Future<Either<CoreFailure, List<CustomerEntity>>> getAllCustomer() async {
    try {
      final allCustoemrs = await _dataBase.customerDao.getAllCustomer();
      return right(allCustoemrs);
    } on DatabaseException catch (_) {
      return left(const CoreFailure.failure(errorMessage: 'Customers list can not fetch.'));
    } catch (e) {
      return left(CoreFailure.failure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<CoreFailure, Unit>> addCustomer(AddCustomerState customer) async {
    final CustomerEntity customerDto = CustomerEntity.fromCustomerState(customer);
    try {
      await _dataBase.customerDao.insertCustomer(customerDto);
      return right(unit);
    } on DatabaseException catch (_) {
      return left(const CoreFailure.failure(
          errorMessage: 'This customer with this information has already been added'));
    } catch (_) {
      return left(const CoreFailure.failure(errorMessage: 'Something went wrong!!'));
    }
  }

  @override
  Future<Either<CoreFailure, Unit>> deleteCustomer(CustomerEntity customer) async {
    try {
      await _dataBase.customerDao.deleteCustomer(customer);
      return right(unit);
    } on DatabaseException catch (_) {
      return left(const CoreFailure.failure(errorMessage: "Customer can't be deleted"));
    } catch (e) {
      return left(CoreFailure.failure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<CoreFailure, Unit>> updateCustomer(CustomerEntity customer) async {
    try {
      await _dataBase.customerDao.updateCustomer(customer);
      return right(unit);
    } on DatabaseException catch (_) {
      return left(const CoreFailure.failure(
          errorMessage:
              "The customer cannot be updated because there is a customer with this information"));
    } catch (e) {
      return left(CoreFailure.failure(errorMessage: e.toString()));
    }
  }
}

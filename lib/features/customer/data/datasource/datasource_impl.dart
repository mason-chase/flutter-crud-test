import 'package:injectable/injectable.dart';
import 'package:mc_crud_test/features/customer/domain/entities/delete_customer/params/delete_customer_params.dart';
import 'package:mc_crud_test/features/customer/domain/entities/delete_customer/response/delete_customer_response.dart';
import 'package:sqflite/sqflite.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/database/database.dart';
import '../../domain/entities/create_customer/params/create_customer_params.dart';
import '../../domain/entities/create_customer/response/create_customer_response.dart';
import 'datasource.dart';

///
/// Customer database implementation.
@LazySingleton(as: CustomerDataSource)
class CustomerDataSourceIMPL implements CustomerDataSource {
  final DatabaseProvider dbProvider = DatabaseProvider.dbProvider;

  /// Create Customer
  @override
  Future<CreateCustomerResponse> createCustomer(
    CreateCustomerParams params,
  ) async {
    final Database db = await dbProvider.database;
    await db.insert(Constants.customerTable, params.customer.toJson());

    /// return new customer to update customers list.
    return CreateCustomerResponse(params.customer);
  }

  /// Get Customers
  /// Update Customer
  /// Delete Customer
  @override
  Future<DeleteCustomerResponse> deleteCustomer(
      DeleteCustomerParams params) async {
    final Database db = await dbProvider.database;
    final int res = await db.delete(
      Constants.customerTable,
      where: 'id = ?',
      whereArgs: <String>[params.customerId],
    );

    return DeleteCustomerResponse(res == 1);
  }
}

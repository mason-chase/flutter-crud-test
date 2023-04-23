
import 'package:floor/floor.dart';
import 'package:mc_crud_test/app/app.constants.dart';
import 'package:mc_crud_test/features/customer/domain/customer.entity.dart';

@dao
abstract class CustomerLocalDataSource {
  @Query('SELECT * FROM ${AppConstants.customerTable}')
  Future<List<Customer>> getCustomers();

  @Insert(onConflict: OnConflictStrategy.fail)
  Future<void> addCustomer(Customer customer);

  @delete
  Future<void> deleteCustomer(Customer customer);

  @Update(onConflict: OnConflictStrategy.fail)
  Future<void> updateCustomer(Customer customer);

}

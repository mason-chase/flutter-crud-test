import 'package:floor/floor.dart';
import 'package:mc_crud_test/domain/customer/entity/customer_entity.dart';
import 'package:mc_crud_test/infrastructure/database/database.dart';

@dao
abstract class CustomerDao {
  @Query("SELECT * FROM ${AppDatabase.customerTable}")
  Future<List<CustomerEntity>> getAllCustomer();

  @Insert(onConflict: OnConflictStrategy.fail)
  Future<void> insertCustomer(CustomerEntity customer);

  @delete
  Future<void> deleteCustomer(CustomerEntity customer);

  @Update(onConflict: OnConflictStrategy.fail)
  Future<void> updateCustomer(CustomerEntity customer);
}

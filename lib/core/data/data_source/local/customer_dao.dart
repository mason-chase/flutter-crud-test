import 'package:floor/floor.dart';

import 'customer_entity.dart';

@dao
abstract class CustomerDao {

  @insert
  Future<void> insertCustomer(CustomerEntity customer);

  @Query("SELECT * FROM CustomerEntity")
  Future<List<CustomerEntity>> getAll();


  @Query("SELECT * FROM CustomerEntity WHERE id =:customerId")
  Future<CustomerEntity?> getCustomer(int customerId);


  @Query("DELETE from CustomerEntity where id =:customerId")
  Future<void> deletePackage(int customerId);
}

import 'package:floor/floor.dart';

import 'customer_entity.dart';

@dao
abstract class CustomerDao {

  @insert
  Future<void> insertCustomer(CustomerEntity customer);

  @Query("SELECT * FROM Customer")
  Future<List<CustomerEntity>> getAll();


  @Query("SELECT * FROM Customer WHERE id =:customerId")
  Future<CustomerEntity?> getCustomer(int customerId);


  @Query("DELETE from Customer where id =:customerId")
  Future<void> deletePackage(int customerId);
}

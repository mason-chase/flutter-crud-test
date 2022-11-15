import '../../../../core/data/data_source/local/customer_entity.dart';

abstract class AddCustomerRepository{

  Future<void> addCustomer(CustomerEntity customer);
}
import 'package:mc_crud_test/core/data/data_source/local/customer_entity.dart';
import 'package:mc_crud_test/core/data/data_source/local/database.dart';
import 'package:mc_crud_test/core/resources/data_state.dart';
import 'package:mc_crud_test/features/add_customer/domain/repository/add_customer_repository.dart';
import 'package:mc_crud_test/locator.dart';
import 'package:sqflite/sqflite.dart';

class AddCustomerRepositoryImpl extends AddCustomerRepository {

  @override
  Future<DataState<CustomerEntity>> addCustomer(CustomerEntity customer) async {
      try {
        await locator<AppDatabase>().database.insert('CustomerEntity', {
          'firstName': customer.firstName,
          'lastName': customer.lastName,
          'phoneNumber': customer.phoneNumber,
          'email': customer.email,
          'bankAccountNumber': customer.bankAccountNumber,
          'dateOfBirth': customer.dateOfBirth,
        },conflictAlgorithm: ConflictAlgorithm.replace);
        return DataSuccess(customer);
      } catch (e) {
        return DataFailed(e.toString());
      }
  }

}

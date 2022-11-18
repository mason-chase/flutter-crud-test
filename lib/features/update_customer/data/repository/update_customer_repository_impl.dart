import 'package:mc_crud_test/core/data/data_source/local/customer_entity.dart';
import 'package:mc_crud_test/core/data/data_source/local/database.dart';
import 'package:mc_crud_test/core/resources/data_state.dart';
import 'package:mc_crud_test/features/update_customer/domain/repository/update_customer_repository.dart';
import 'package:mc_crud_test/locator.dart';


class UpdateCustomerRepositoryImpl extends UpdateCustomerRepository {

  @override
  Future<DataState<CustomerEntity>> updateCustomer(
      CustomerEntity customer) async {
    try {
      await locator<AppDatabase>().database.update(
          'CustomerEntity',
          {
            'firstName': customer.firstName,
            'lastName': customer.lastName,
            'phoneNumber': customer.phoneNumber,
            'email': customer.email,
            'bankAccountNumber': customer.bankAccountNumber,
            'dateOfBirth': customer.dateOfBirth,
          },
          where: 'id = ?',
          whereArgs: [customer.id]);
      return DataSuccess(customer);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }
}

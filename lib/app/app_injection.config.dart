import 'package:mc_crud_test/app/app.database.dart';
import 'package:mc_crud_test/core/utils/app.utils.dart';
import 'package:mc_crud_test/features/customer/domain/customer.respository.dart';
import 'package:mc_crud_test/features/customer/domain/usecases/add_customer.usecase.dart';
import 'package:mc_crud_test/features/customer/domain/usecases/delete_customer.usecase.dart';
import 'package:mc_crud_test/features/customer/domain/usecases/get_customer_list.usecase.dart';
import 'package:mc_crud_test/features/customer/presentation/addCustomer/bloc/add_customer.bloc.dart';
import 'package:mc_crud_test/features/customer/presentation/customerList/bloc/customer_list.bloc.dart';

import '../features/customer/data/customer_repository.impl.dart';

class _AppInjectionConfig extends AppInjectionConfig {}

Future<void> setup() async {
  var app = _AppInjectionConfig();
  await AppDatabase.initializeDatabase();

  // Customer
  getIt.registerFactory(() => app._customerRepository);
  getIt.registerFactory(() => app._customerListBloc);
  getIt.registerFactory(() => app._addCustomerBloc);
  getIt.registerFactory(() => app._addCustomerUseCase);
  getIt.registerFactory(() => app._getCustomerListUseCase);
  getIt.registerFactory(() => app._deleteCustomerUseCase);
}

abstract class AppInjectionConfig {
  // customer
  CustomerRepository get _customerRepository =>
      CustomerRepositoryImpl(appDatabase: inject());

  CustomerListBloc get _customerListBloc => CustomerListBloc(
      getCustomerListUseCase: inject(), deleteCustomerUseCase: inject());

  AddCustomerBloc get _addCustomerBloc =>
      AddCustomerBloc(addCustomerUseCase: inject());

  AddCustomerUseCase get _addCustomerUseCase => AddCustomerUseCase(inject());

  GetCustomerListUseCase get _getCustomerListUseCase =>
      GetCustomerListUseCase(inject());

  DeleteCustomerUseCase get _deleteCustomerUseCase =>
      DeleteCustomerUseCase(inject());
}

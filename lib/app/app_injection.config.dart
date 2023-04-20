import 'package:get_it/get_it.dart';
import 'package:mc_crud_test/app/app.database.dart';
import 'package:mc_crud_test/core/utils/app.utils.dart';
import 'package:mc_crud_test/features/customer/domain/customer.respository.dart';
import 'package:mc_crud_test/features/customer/domain/usecases/get_customer_list.usecase.dart';
import 'package:mc_crud_test/features/customer/presentation/customerList/bloc/customer_list.bloc.dart';

import '../features/customer/data/customer_repository.impl.dart';



class _AppInjectionConfig extends AppInjectionConfig {}

Future<void> setup() async {

  var app = _AppInjectionConfig();
  await AppDatabase.initializeDatabase();
  getIt.registerFactory(() => app._customerRepository);
  getIt.registerFactory(() => app._getCustomerListUseCase);
  getIt.registerFactory(() => app._customerBloc);
}

abstract class AppInjectionConfig{
  AppDatabase get _appDatabase => inject();

  CustomerRepository get _customerRepository =>
      CustomerRepositoryImpl(appDatabase: inject());

  GetCustomerListUseCase get _getCustomerListUseCase =>
      GetCustomerListUseCase( inject());



  CustomerListBloc get _customerBloc => CustomerListBloc(
      getCustomerListUseCase: inject()
  );
}
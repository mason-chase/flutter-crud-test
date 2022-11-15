

import 'package:get_it/get_it.dart';
import 'package:mc_crud_test/features/get_customers/data/repository/customer_list_repository_impl.dart';
import 'package:mc_crud_test/features/get_customers/domain/repository/customer_list_repository.dart';
import 'package:mc_crud_test/features/get_customers/presentation/bloc/customers_bloc.dart';

import 'core/data/data_source/local/database.dart';
import 'features/get_customers/domain/usecase/customer_list_usecase.dart';

GetIt locator = GetIt.instance;

setup() async {

  final database =
  await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  locator.registerSingleton<AppDatabase>(database);

  /// Repository
  locator
      .registerSingleton<CustomerListRepository>(CustomerListRepositoryImpl(database.customerDao));

  /// Usecase
  locator.registerSingleton<GetCustomerListUseCase>(
      GetCustomerListUseCase(locator()));

  /// Bloc
  locator.registerFactory<CustomerListBloc>( () => CustomerListBloc(locator()));

}
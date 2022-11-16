

import 'package:get_it/get_it.dart';
import 'package:mc_crud_test/features/add_customer/data/repository/add_customer_repository_impl.dart';
import 'package:mc_crud_test/features/add_customer/domain/repository/add_customer_repository.dart';
import 'package:mc_crud_test/features/add_customer/domain/usecase/add_customer_usecase.dart';
import 'package:mc_crud_test/features/add_customer/presentation/bloc/add_customer_bloc.dart';
import 'package:mc_crud_test/features/delete_customer/data/repository/delete_customer_repository_impl.dart';
import 'package:mc_crud_test/features/delete_customer/domain/repository/delete_customer_repository.dart';
import 'package:mc_crud_test/features/delete_customer/domain/usecase/delete_customer_usecase.dart';
import 'package:mc_crud_test/features/delete_customer/presentation/bloc/delete_customer_bloc.dart';
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
  locator.registerSingleton<CustomerListRepository>(CustomerListRepositoryImpl(database.customerDao));
  locator.registerSingleton<AddCustomerRepository>(AddCustomerRepositoryImpl(database.customerDao));
  locator.registerSingleton<DeleteCustomerRepository>(DeleteCustomerRepositoryImpl(database.customerDao));

  /// Usecase
  locator.registerSingleton<GetCustomerListUseCase>(GetCustomerListUseCase(locator()));
  locator.registerSingleton<AddCustomerUseCase>(AddCustomerUseCase(locator()));
  locator.registerSingleton<DeleteCustomerUseCase>(DeleteCustomerUseCase(locator()));

  /// Bloc
  locator.registerFactory<CustomerListBloc>( () => CustomerListBloc(locator()));
  locator.registerFactory<AddCustomerBloc>( () => AddCustomerBloc(locator()));
  locator.registerFactory<DeleteCustomerBloc>( () => DeleteCustomerBloc(locator()));

}
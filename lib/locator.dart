

import 'package:get_it/get_it.dart';
import 'package:mc_crud_test/core/utils/app_utils.dart';
import 'package:mc_crud_test/features/add_customer/data/repository/add_customer_repository_impl.dart';
import 'package:mc_crud_test/features/add_customer/domain/repository/add_customer_repository.dart';
import 'package:mc_crud_test/features/add_customer/domain/usecase/add_customer_usecase.dart';
import 'package:mc_crud_test/features/add_customer/presentation/bloc/add_customer_bloc.dart';
import 'package:mc_crud_test/features/customer_list/data/repository/delete_customer_repository_impl.dart';
import 'package:mc_crud_test/features/customer_list/domain/repository/delete_customer_repository.dart';
import 'package:mc_crud_test/features/customer_list/domain/usecase/delete_customer_usecase.dart';
import 'package:mc_crud_test/features/customer_list/presentation/bloc/delete_bloc/delete_customer_bloc.dart';
import 'package:mc_crud_test/features/customer_list/data/repository/customer_list_repository_impl.dart';
import 'package:mc_crud_test/features/customer_list/domain/repository/customer_list_repository.dart';
import 'package:mc_crud_test/features/customer_list/presentation/bloc/customer_list_bloc/customers_bloc.dart';
import 'package:mc_crud_test/features/update_customer/data/repository/update_customer_repository_impl.dart';
import 'package:mc_crud_test/features/update_customer/domain/repository/update_customer_repository.dart';
import 'package:mc_crud_test/features/update_customer/domain/usecase/update_customer_usecase.dart';
import 'package:mc_crud_test/features/update_customer/presentation/bloc/update_customer_bloc.dart';

import 'core/data/data_source/local/database.dart';
import 'features/customer_list/domain/usecase/customer_list_usecase.dart';

GetIt locator = GetIt.instance;

setup() async {

  final database =
  await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  locator.registerSingleton<AppDatabase>(database);

  locator.registerSingleton<AppUtils>(AppUtils());

  /// Repository
  locator.registerSingleton<CustomerListRepository>(CustomerListRepositoryImpl(database.customerDao));
  locator.registerSingleton<AddCustomerRepository>(AddCustomerRepositoryImpl());
  locator.registerSingleton<DeleteCustomerRepository>(DeleteCustomerRepositoryImpl(database.customerDao));
  locator.registerSingleton<UpdateCustomerRepository>(UpdateCustomerRepositoryImpl());

  /// Usecase
  locator.registerSingleton<GetCustomerListUseCase>(GetCustomerListUseCase(locator()));
  locator.registerSingleton<AddCustomerUseCase>(AddCustomerUseCase(locator()));
  locator.registerSingleton<DeleteCustomerUseCase>(DeleteCustomerUseCase(locator()));
  locator.registerSingleton<UpdateCustomerUseCase>(UpdateCustomerUseCase(locator()));

  /// Bloc
  locator.registerFactory<CustomerListBloc>( () => CustomerListBloc(locator()));
  locator.registerFactory<AddCustomerBloc>( () => AddCustomerBloc(locator()));
  locator.registerFactory<DeleteCustomerBloc>( () => DeleteCustomerBloc(locator()));
  locator.registerFactory<UpdateCustomerBloc>( () => UpdateCustomerBloc(locator()));

}
import 'package:bloc_test/bloc_test.dart';
import 'package:mc_crud_test/core/utils/app.utils.dart';
import 'package:mc_crud_test/features/customer/domain/customer.respository.dart';
import 'package:mc_crud_test/features/customer/domain/usecases/get_customer_list.usecase.dart';
import 'package:mc_crud_test/features/customer/presentation/customerList/bloc/customer_list.bloc.dart';
import 'package:mc_crud_test/features/customer/presentation/customerList/bloc/customer_list.event.dart';

import '../../domain/customer_usecases_test.mocks.dart';
import '../../presentation/customerList/customer_list.page_test.dart';
import '../../presentation/customerList/customer_list_bloc_test.mocks.dart';

void setupTestInjection() async {

  getIt.registerLazySingleton<CustomerRepository>(
      () => MockCustomerRepository());
  getIt.registerLazySingleton<GetCustomerListUseCase>(
      () => MockGetCustomerListUseCase());
  getIt.registerLazySingleton<CustomerListBloc>(() => MockCustomerListBloc());
}

void resetInjection(){
  getIt.reset();
}





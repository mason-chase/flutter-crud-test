import 'package:bloc_test/bloc_test.dart';
import 'package:mc_crud_test/core/utils/app.utils.dart';
import 'package:mc_crud_test/features/customer/domain/customer.respository.dart';
import 'package:mc_crud_test/features/customer/domain/usecases/add_customer.usecase.dart';
import 'package:mc_crud_test/features/customer/domain/usecases/get_customer_list.usecase.dart';
import 'package:mc_crud_test/features/customer/domain/usecases/update_customer.usecase.dart';
import 'package:mc_crud_test/features/customer/presentation/addCustomer/bloc/add_customer.bloc.dart';
import 'package:mc_crud_test/features/customer/presentation/addCustomer/bloc/add_customer.event.dart';
import 'package:mc_crud_test/features/customer/presentation/addCustomer/bloc/add_customer.state.dart';
import 'package:mc_crud_test/features/customer/presentation/customerList/bloc/customer_list.bloc.dart';
import 'package:mc_crud_test/features/customer/presentation/customerList/bloc/customer_list.event.dart';
import 'package:mc_crud_test/features/customer/presentation/customerList/bloc/customer_list.state.dart';

import 'customer/domain/get_customer_list_usecases_test.mocks.dart';
import 'customer/presentation/addCustomer/add_customer.bloc_test.mocks.dart';
import 'customer/presentation/customerList/customer_list_bloc_test.mocks.dart';

void setupTestInjection() async {
  getIt.registerLazySingleton<CustomerRepository>(
          () => MockCustomerRepository());
  _setupCustomerListInjection();
  _setupAddCustomerInjection();
}

void _setupAddCustomerInjection() async {

  getIt.registerLazySingleton<AddCustomerUseCase>(
          () => MockAddCustomerUseCase());
  getIt.registerLazySingleton<UpdateCustomerUseCase>(
          () => MockUpdateCustomerUseCase());
  getIt.registerLazySingleton<AddCustomerBloc>(() => MockAddCustomerBloc());
}

void _setupCustomerListInjection() async {
  getIt.registerLazySingleton<GetCustomerListUseCase>(
          () => MockGetCustomerListUseCase());
  getIt.registerLazySingleton<CustomerListBloc>(() => MockCustomerListBloc());
}

void resetInjection() {
  getIt.reset();
}

class MockCustomerListBloc
    extends MockBloc<CustomerListEvent, CustomerListState>
    implements CustomerListBloc {}

class MockAddCustomerBloc extends MockBloc<AddCustomerEvent, AddCustomerState>
    implements AddCustomerBloc {}




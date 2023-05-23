import 'package:get_it/get_it.dart';
import 'package:mc_crud_test/features/customer/data/repositories/customer_repository_impl.dart';
import '../../features/customer/data/datasources/customer_local_data_source.dart';
import '../../features/customer/domain/repositories/customer_repository.dart';
import '../../features/customer/domain/usecases/add_customer_usecase.dart';
import '../../features/customer/domain/usecases/delete_customer_usecase.dart';
import '../../features/customer/domain/usecases/edit_customer_usecase.dart';
import '../../features/customer/domain/usecases/get_customer_by_id_usecase.dart';
import '../../features/customer/domain/usecases/get_customers_usecase.dart';
import '../../features/customer/presentation/bloc/customer_bloc.dart';

final _getIt = GetIt.instance;

T inject<T extends Object>() => _getIt.call();

class _$AppModule extends _AppModule {}

Future<void> setup() async {
  var app = _$AppModule();
  _getIt.registerSingleton(app._customerLocalDataSource);
  _getIt.registerFactory(() => app._customerRepository);
  _getIt.registerFactory(() => app._addCustomer);
  _getIt.registerFactory(() => app._deleteCustomer);
  _getIt.registerFactory(() => app._editCustomer);
  _getIt.registerFactory(() => app._getCustomerById);
  _getIt.registerFactory(() => app._getCustomers);
  _getIt.registerFactory(() => app._customerBloc);
}

abstract class _AppModule {
  CustomerLocalDataSource get _customerLocalDataSource =>
      CustomerLocalDataSourceImpl();

  CustomerRepository get _customerRepository =>
      CustomerRepositoryImpl(localDataSource: inject());

  AddCustomerUseCase get _addCustomer =>
      AddCustomerUseCase(repository: inject());

  DeleteCustomerUseCase get _deleteCustomer =>
      DeleteCustomerUseCase(repository: inject());

  EditCustomerUseCase get _editCustomer =>
      EditCustomerUseCase(repository: inject());

  GetCustomerByIdUseCase get _getCustomerById =>
      GetCustomerByIdUseCase(repository: inject());

  GetCustomersUseCase get _getCustomers =>
      GetCustomersUseCase(repository: inject());

  CustomerBloc get _customerBloc => CustomerBloc(
        addCustomerUseCase: inject(),
        deleteCustomerUseCase: inject(),
        editCustomerUseCase: inject(),
        getCustomerByIdUseCase: inject(),
        getCustomersUseCase: inject(),
      );
}

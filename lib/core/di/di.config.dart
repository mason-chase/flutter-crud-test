// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/customer/data/datasource/datasource.dart' as _i3;
import '../../features/customer/data/datasource/datasource_impl.dart' as _i4;
import '../../features/customer/data/repository/repository_impl.dart' as _i6;
import '../../features/customer/domain/repository/repository.dart' as _i5;
import '../../features/customer/domain/usecases/create_customer.dart' as _i15;
import '../../features/customer/domain/usecases/delete_customer.dart' as _i7;
import '../../features/customer/domain/usecases/get_customers.dart' as _i10;
import '../../features/customer/domain/usecases/update_customer.dart' as _i12;
import '../../features/customer/presentation/controllers/create_customer/cubit.dart'
    as _i16;
import '../../features/customer/presentation/controllers/delete_customer/cubit.dart'
    as _i8;
import '../../features/customer/presentation/controllers/get_customers/cubit.dart'
    as _i11;
import '../../features/customer/presentation/controllers/update_customer/cubit.dart'
    as _i13;
import '../error/error_translator.dart' as _i9;
import '../helpers/validator.dart'
    as _i14; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.lazySingleton<_i3.CustomerDataSource>(() => _i4.CustomerDataSourceIMPL());
  gh.lazySingleton<_i5.CustomerRepository>(
      () => _i6.CustomerRepositoryIMPL(get<_i3.CustomerDataSource>()));
  gh.lazySingleton<_i7.DeleteCustomer>(
      () => _i7.DeleteCustomer(get<_i5.CustomerRepository>()));
  gh.factory<_i8.DeleteCustomerCubit>(
      () => _i8.DeleteCustomerCubit(deleteCustomer: get<_i7.DeleteCustomer>()));
  gh.lazySingleton<_i9.ErrorTranslator>(() => _i9.ErrorTranslator());
  gh.lazySingleton<_i10.GetCustomers>(
      () => _i10.GetCustomers(get<_i5.CustomerRepository>()));
  gh.factory<_i11.GetCustomersCubit>(
      () => _i11.GetCustomersCubit(getCustomers: get<_i10.GetCustomers>()));
  gh.lazySingleton<_i12.UpdateCustomer>(
      () => _i12.UpdateCustomer(get<_i5.CustomerRepository>()));
  gh.factory<_i13.UpdateCustomerCubit>(() =>
      _i13.UpdateCustomerCubit(updateCustomer: get<_i12.UpdateCustomer>()));
  gh.lazySingleton<_i14.Validator>(() => _i14.Validator());
  gh.lazySingleton<_i15.CreateCustomer>(
      () => _i15.CreateCustomer(get<_i5.CustomerRepository>()));
  gh.factory<_i16.CreateCustomerCubit>(() =>
      _i16.CreateCustomerCubit(createCustomer: get<_i15.CreateCustomer>()));
  return get;
}

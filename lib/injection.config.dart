// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:mc_crud_test/application/customer/add_customer/add_customer_bloc.dart'
    as _i7;
import 'package:mc_crud_test/domain/customer/i_customer_facade.dart' as _i3;
import 'package:mc_crud_test/infrastructure/customer/customer_facade.dart'
    as _i4;
import 'package:mc_crud_test/presentation/routing/routing.dart' as _i5;
import 'package:mc_crud_test/presentation/theme/theme_config.dart' as _i6;

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  /// initializes the registration of main-scope dependencies inside of [GetIt]
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.ICustomerFacade>(() => _i4.CustomerFacade());
    gh.lazySingleton<_i5.Routing>(() => _i5.Routing());
    gh.lazySingleton<_i6.ThemeConfig>(() => _i6.ThemeConfig());
    gh.factory<_i7.AddCustomerBloc>(
        () => _i7.AddCustomerBloc(gh<_i3.ICustomerFacade>()));
    return this;
  }
}

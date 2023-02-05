// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:another_flushbar/flushbar.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:mc_crud_test/application/customer/add_customer/add_customer_bloc.dart'
    as _i10;
import 'package:mc_crud_test/application/customer/get_all_customer/get_all_customer_cubit.dart'
    as _i11;
import 'package:mc_crud_test/domain/customer/i_customer_facade.dart' as _i5;
import 'package:mc_crud_test/infrastructure/core/injectable_module.dart'
    as _i12;
import 'package:mc_crud_test/infrastructure/customer/customer_facade.dart'
    as _i6;
import 'package:mc_crud_test/infrastructure/database/database.dart' as _i7;
import 'package:mc_crud_test/presentation/routing/routing.dart' as _i8;
import 'package:mc_crud_test/presentation/theme/theme_config.dart' as _i9;
import 'package:mc_crud_test/presentation/widget/flushybar.dart' as _i4;

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
    final injectableModule = _$InjectableModule();
    gh.lazySingleton<_i3.Flushbar<dynamic>>(() => injectableModule.flushbar);
    gh.lazySingleton<_i4.FlushyBar>(
        () => _i4.FlushyBar(gh<_i3.Flushbar<dynamic>>()));
    gh.lazySingleton<_i5.ICustomerFacade>(
        () => _i6.CustomerFacade(gh<_i7.AppDatabase>()));
    gh.lazySingleton<_i8.Routing>(() => _i8.Routing());
    gh.lazySingleton<_i9.ThemeConfig>(() => _i9.ThemeConfig());
    gh.factory<_i10.AddCustomerBloc>(
        () => _i10.AddCustomerBloc(gh<_i5.ICustomerFacade>()));
    gh.factory<_i11.GetAllCustomerCubit>(
        () => _i11.GetAllCustomerCubit(gh<_i5.ICustomerFacade>()));
    return this;
  }
}

class _$InjectableModule extends _i12.InjectableModule {}

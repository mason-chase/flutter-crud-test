import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mc_crud_test/app/app_routes.dart';
import 'package:mc_crud_test/core/utils/app.utils.dart';
import 'package:mc_crud_test/features/customer/presentation/addCustomer/add_or_update_customer.page.dart';
import 'package:mc_crud_test/features/customer/presentation/addCustomer/bloc/add_customer.bloc.dart';
import 'package:mc_crud_test/features/customer/presentation/addCustomer/bloc/add_customer.state.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../test_injection_helper.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

Future<void> theAppIsRunning(WidgetTester tester) async {
  setupTestInjection();
  final bloc = getIt<AddCustomerBloc>();
  MockNavigatorObserver navigatorObserver = MockNavigatorObserver();

  final Map<String, WidgetBuilder> routes = {
    AppRoutes.addCustomer: (_) => const AddOrUpdateCustomerPage(),
  };
  whenListen<AddCustomerState>(
      bloc,
      Stream.fromIterable(
        [const AddCustomerInitial()],
      ),
      initialState: const AddCustomerInitial());
  await tester.pumpWidget(
    MultiBlocProvider(
      providers: [BlocProvider<AddCustomerBloc>.value(value: bloc)],
      child: ScreenUtilInit(
          builder: (ctx, child) => MaterialApp(
                title: 'Flutter Demo',
                routes: routes,
                initialRoute: AppRoutes.addCustomer,
                navigatorObservers: [navigatorObserver],
              )),
    ),
  );
}

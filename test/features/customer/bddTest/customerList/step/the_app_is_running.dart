import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mc_crud_test/app/app_routes.dart';
import 'package:mc_crud_test/core/utils/app.utils.dart';
import 'package:mc_crud_test/features/customer/presentation/customerList/bloc/customer_list.bloc.dart';
import 'package:mc_crud_test/features/customer/presentation/customerList/bloc/customer_list.state.dart';
import 'package:mc_crud_test/features/customer/presentation/customerList/customer_list.page.dart';
import 'package:mc_crud_test/main.dart';

import '../../../customer_test.constants.dart';
import '../test_injection_helper.dart';

Future<void> theAppIsRunning(WidgetTester tester,int state) async {
  setupTestInjection();
  final bloc = getIt<CustomerListBloc>();
  final Map<String, WidgetBuilder> routes = {
    AppRoutes.customerList: (_) => const CustomerListPage(),
  };
  if(state==0) {
    whenListen(bloc, Stream.fromIterable([Loading()]),
      initialState: Empty());
  } else if(state==1) {
    whenListen(bloc, Stream.fromIterable([ListLoaded([])]),
        initialState: ListLoaded(tCustomerList));
  } else if(state==-1) {
    whenListen(bloc, Stream.fromIterable([Error("Error")]),
        initialState:Error("Error"));
  }

  await tester.pumpWidget(
    MultiBlocProvider(
      providers: [BlocProvider<CustomerListBloc>.value(value: bloc)],
      child: MaterialApp(
        title: 'Flutter Demo',
        routes: routes,
        initialRoute: AppRoutes.customerList,
      ),
    ),
  );
}

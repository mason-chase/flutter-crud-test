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
import 'package:mc_crud_test/features/customer/presentation/customerList/bloc/customer_list.bloc.dart';
import 'package:mc_crud_test/features/customer/presentation/customerList/bloc/customer_list.state.dart';
import 'package:mc_crud_test/features/customer/presentation/customerList/customer_list.page.dart';

import '../../../../test_injection_helper.dart';
import '../../../customer_test.constants.dart';

Future<void> theAppIsRunning(WidgetTester tester,int state) async {
  setupTestInjection();
  final bloc = getIt<CustomerListBloc>();
  final addCustomerBloc = getIt<AddCustomerBloc>();
  final Map<String, WidgetBuilder> routes = {
    AppRoutes.customerList: (_) => const CustomerListPage(),
    AppRoutes.addCustomer: (_) => const AddOrUpdateCustomerPage(),
    AppRoutes.updateCustomer: (_) => const AddOrUpdateCustomerPage(initialCustomer: tCustomer,),
  };
  if(state==0) {
    whenListen(bloc, Stream.fromIterable([Loading()]),
      initialState: Empty());
  } else if(state==1) {
    whenListen(bloc, Stream.fromIterable([ListLoaded(tCustomerList)]),
        initialState: ListLoaded(tCustomerList));
  } else if(state==-1) {
    whenListen(bloc, Stream.fromIterable([Error("Error")]),
        initialState:Error("Error"));
  }
  whenListen(addCustomerBloc, Stream.fromIterable([const AddCustomerInitial()]),
      initialState: const AddCustomerInitial());
  await tester.pumpWidget(
    MultiBlocProvider(
      providers: [BlocProvider<CustomerListBloc>.value(value: bloc),BlocProvider<AddCustomerBloc>.value(value: addCustomerBloc)],
      child:ScreenUtilInit(
          builder: (ctx, child) => MaterialApp(
            title: 'Flutter Demo',
            routes: routes,
            initialRoute: AppRoutes.customerList,
          )),
    ),
  );
}

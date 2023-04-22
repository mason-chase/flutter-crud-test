import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mc_crud_test/core/utils/app.utils.dart';
import 'package:mc_crud_test/features/customer/presentation/addCustomer/add_customer.page.dart';
import 'package:mc_crud_test/features/customer/presentation/addCustomer/bloc/add_customer.bloc.dart';
import 'package:mc_crud_test/features/customer/presentation/customerList/bloc/customer_list.bloc.dart';
import 'package:mc_crud_test/features/customer/presentation/customerList/bloc/customer_list.event.dart';
import 'package:mc_crud_test/features/customer/presentation/customerList/customer_list.page.dart';

abstract class AppRoutes {
  static const customerList = '/';
  static const addCustomer = '/addCustomer';

  static getRoutes(context) {
    final Map<String, WidgetBuilder> routes = {
      customerList: (_) => _makeCustomerListPage(),
      addCustomer: (_) => _makeAddCustomerPage(),
    };
    return routes;
  }

  static BlocProvider<CustomerListBloc> _makeCustomerListPage() {
    return BlocProvider(
      create: (context) => CustomerListBloc(
          getCustomerListUseCase: inject(), deleteCustomerUseCase: inject())
        ..add(GetCustomerList()),
      child: const CustomerListPage(),
    );
  }

  static BlocProvider<AddCustomerBloc> _makeAddCustomerPage() {
    return BlocProvider(
      create: (context) => AddCustomerBloc(addCustomerUseCase: inject()),
      child: const AddCustomerPage(),
    );
  }
}

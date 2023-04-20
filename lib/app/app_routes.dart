import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mc_crud_test/core/utils/app.utils.dart';
import 'package:mc_crud_test/features/customer/presentation/customerList/bloc/customer_list.bloc.dart';
import 'package:mc_crud_test/features/customer/presentation/customerList/customer_list.page.dart';

abstract class AppRoutes {
  static const customerList = '/';

  static getRoutes(context) {
    final Map<String, WidgetBuilder> routes = {
      customerList: (_) => _makeCustomerListPage(),
    };
    return routes;
  }

  static BlocProvider<CustomerListBloc> _makeCustomerListPage() {
    return BlocProvider(
      create: (context) => CustomerListBloc(getCustomerListUseCase: inject()),
      child: const CustomerListPage(),
    );
  }
}

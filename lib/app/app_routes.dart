import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mc_crud_test/core/utils/app.utils.dart';
import 'package:mc_crud_test/features/customer/domain/customer.entity.dart';
import 'package:mc_crud_test/features/customer/presentation/addCustomer/add_or_update_customer.page.dart';
import 'package:mc_crud_test/features/customer/presentation/addCustomer/bloc/add_customer.bloc.dart';
import 'package:mc_crud_test/features/customer/presentation/customerList/bloc/customer_list.bloc.dart';
import 'package:mc_crud_test/features/customer/presentation/customerList/bloc/customer_list.event.dart';
import 'package:mc_crud_test/features/customer/presentation/customerList/customer_list.page.dart';

abstract class AppRoutes {
  static const customerList = '/';
  static const addCustomer = '/addCustomer';
  static const updateCustomer = '/editCustomer';

  static getRoutes(context) {
    final Map<String, WidgetBuilder> routes = {
      customerList: (_) => _makeCustomerListPage(),
      addCustomer: (context) => _makeAddCustomerPage(context),
      // read customer from arguments and pass to page
      updateCustomer: (context) => _makeAddCustomerPage(context)
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

  static BlocProvider<AddCustomerBloc> _makeAddCustomerPage(context) {
    Customer? customer =
        ModalRoute.of(context)?.settings.arguments as Customer?;
    return BlocProvider(
      create: (context) => AddCustomerBloc(
          addCustomerUseCase: inject(), updateCustomerUseCase: inject()),
      child: AddOrUpdateCustomerPage(
        initialCustomer: customer,
      ),
    );
  }
}

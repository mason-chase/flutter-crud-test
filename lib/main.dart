import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mc_crud_test/config/app_theme.dart';
import 'package:mc_crud_test/features/add_customer/presentation/bloc/add_customer_bloc.dart';
import 'package:mc_crud_test/features/customer_list/presentation/bloc/delete_bloc/delete_customer_bloc.dart';
import 'package:mc_crud_test/features/customer_list/presentation/bloc/customer_list_bloc/customers_bloc.dart';
import 'package:mc_crud_test/features/customer_list/presentation/screens/customers.dart';
import 'package:mc_crud_test/features/update_customer/presentation/bloc/update_customer_bloc.dart';
import 'package:mc_crud_test/locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => locator<CustomerListBloc>(),
        ),
        BlocProvider(
          create: (context) => locator<AddCustomerBloc>(),
        ),
        BlocProvider(
          create: (context) => locator<DeleteCustomerBloc>(),
        ),
        BlocProvider(
          create: (context) => locator<UpdateCustomerBloc>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Customer',
        theme: appTheme(),
        home: AllCustomers(),
      ),
    );
  }
}

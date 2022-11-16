import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mc_crud_test/features/add_customer/presentation/bloc/add_customer_bloc.dart';
import 'package:mc_crud_test/features/get_customers/presentation/bloc/customers_bloc.dart';
import 'package:mc_crud_test/features/get_customers/presentation/screens/customers.dart';
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
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Customer',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: AllCustomers(),
      ),
    );
  }
}

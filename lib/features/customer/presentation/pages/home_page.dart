import 'package:flutter/material.dart';
import 'package:mc_crud_test/core/services/service_locator.dart';
import 'package:mc_crud_test/features/customer/presentation/bloc/customer_bloc.dart';
import 'package:mc_crud_test/features/customer/presentation/bloc/customer_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mc_crud_test/features/customer/presentation/widgets/custom_loading.dart';
import '../bloc/customer_state.dart';
import '../widgets/custom_error.dart';
import '../widgets/customer_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CustomerBloc _customerBloc = inject();

  @override
  void initState() {
    _customerBloc.add(const CustomerEvent.getCustomers());
    super.initState();
  }

  @override
  void dispose() {
    _customerBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Customers"),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => _customerBloc,
        child: BlocBuilder<CustomerBloc, CustomerState>(
          buildWhen: (previous, current) {
            return current.maybeWhen(
              orElse: () => false,
              error: (message, isLoading) => true,
              successGetCustomers: (data, isLoading) => true,
            );
          },
          builder: (context, state) {
            if (state.isLoading) {
              return const CustomLoading();
            } else {
              return state.maybeWhen(
                orElse: () => const CustomLoading(),
                error: (message, isLoading) => CustomError(message: message),
                successGetCustomers: (data, isLoading) {
                  return ListView.builder(
                    itemCount: data.length,
                    clipBehavior: Clip.hardEdge,
                    padding: EdgeInsets.zero,
                    shrinkWrap: false,
                    itemExtent: 200,
                    itemBuilder: (context, index) {
                      return CustomerItem(model: data.elementAt(index));
                    },
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}

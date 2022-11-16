import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:mc_crud_test/features/add_customer/presentation/screens/add_customer.dart';
import 'package:mc_crud_test/features/get_customers/presentation/bloc/customers_bloc.dart';
import 'package:mc_crud_test/features/get_customers/presentation/bloc/customers_status.dart';

import '../widgets/customer_list.dart';

class AllCustomers extends StatefulWidget {
  const AllCustomers({Key? key}) : super(key: key);

  @override
  State<AllCustomers> createState() => _AllCustomersState();
}

class _AllCustomersState extends State<AllCustomers> {
  Logger logger = Logger(printer: PrettyPrinter());

  _loadData() {
    BlocProvider.of<CustomerListBloc>(context).add(GetAllCustomersEvent());
  }

  @override
  void initState() {
    super.initState();
    logger.d("init state");
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    logger.d("BuildContext");
    return Scaffold(
      appBar: AppBar(
        title: Text("Customers"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddCustomerScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 16.0,
              ),
              BlocBuilder<CustomerListBloc, CustomersState>(
                buildWhen: (previous, current) {
                  if (current.getAllCustomersStatus ==
                      previous.getAllCustomersStatus) {
                    return false;
                  } else {
                    return true;
                  }
                },
                builder: (context, state) {
                  logger.d(state);
                  if (state.getAllCustomersStatus is CustomersLoading) {
                    return CircularProgressIndicator();
                  }
                  if (state.getAllCustomersStatus is GetAllCustomersCompleted) {
                    GetAllCustomersCompleted getAllCustomersCompleted =
                        state.getAllCustomersStatus as GetAllCustomersCompleted;
                    var customerList = getAllCustomersCompleted.customerList;
                    if (customerList.isNotEmpty) {
                      return CustomerList(customerList: customerList);
                    } else {
                      return Container();
                    }
                  }
                  if (state.getAllCustomersStatus is GetAllCustomersError) {
                    return SizedBox();
                  }
                  return Container();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

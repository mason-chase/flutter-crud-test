import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mc_crud_test/features/add_customer/presentation/screens/add_customer.dart';
import 'package:mc_crud_test/features/customer_list/presentation/bloc/customer_list_bloc/customers_bloc.dart';
import 'package:mc_crud_test/features/customer_list/presentation/bloc/customer_list_bloc/customers_status.dart';
import 'package:mc_crud_test/features/customer_list/presentation/widgets/empty_list.dart';
import 'package:mc_crud_test/features/customer_list/presentation/widgets/error_loading_data.dart';
import 'package:mc_crud_test/features/customer_list/presentation/widgets/loading_data.dart';

import '../widgets/customer_list.dart';

class AllCustomers extends StatefulWidget {
  const AllCustomers({Key? key}) : super(key: key);

  @override
  State<AllCustomers> createState() => _AllCustomersState();
}

class _AllCustomersState extends State<AllCustomers> {

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CustomerListBloc>(context).add(CustomersEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddCustomerScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: ExactAssetImage('assets/images/main_bg.png'),
            fit: BoxFit.fitWidth,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
            decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
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
                      if (state.getAllCustomersStatus is CustomersLoading) {
                        return const LoadingData();
                      }
                      if (state.getAllCustomersStatus
                          is GetAllCustomersCompleted) {
                        GetAllCustomersCompleted getAllCustomersCompleted =
                            state.getAllCustomersStatus
                                as GetAllCustomersCompleted;
                        var customerList =
                            getAllCustomersCompleted.customerList;
                        if (customerList.isNotEmpty) {
                          return CustomerList(customerList: customerList);
                        } else {
                          return const EmptyCustomerList();
                        }
                      }
                      if (state.getAllCustomersStatus is GetAllCustomersError) {
                        return const ErrorLoadingData();
                      }
                      return Container();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

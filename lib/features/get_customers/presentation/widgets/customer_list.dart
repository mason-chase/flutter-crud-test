import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mc_crud_test/core/data/data_source/local/customer_entity.dart';
import 'package:mc_crud_test/features/delete_customer/presentation/bloc/delete_customer_bloc.dart';
import 'package:mc_crud_test/features/update_customer/presentation/screens/update_customer.dart';

import '../bloc/customers_bloc.dart';

class CustomerList extends StatelessWidget {
  List<CustomerEntity> customerList;

  CustomerList({required this.customerList, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // height: 512,
      child: SingleChildScrollView(
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: customerList.length,
          itemBuilder: (context, index) {
        return Container(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              children: [
                Expanded(
                    child: Container(
                        child: IconButton(icon: Icon(Icons.delete), color: Theme.of(context).iconTheme.color, onPressed: () {
                          BlocProvider.of<DeleteCustomerBloc>(context).add(DeleteCustomerEvent(customerList[index].id!));
                          BlocProvider.of<CustomerListBloc>(context).add(GetAllCustomersEvent());
                        },
                ))),
                Expanded(child: Container(
                        child: IconButton(icon: Icon(Icons.person), color: Theme.of(context).iconTheme.color, onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => UpdateCustomerScreen(customerEntity: customerList[index]),
                            ),
                          );
                        },
                ))),
                Expanded(
                  flex: 6,
                  child: Container(
                    width: double.infinity,
                    child: Text(
                      customerList[index].firstName!,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
          },
        ),
      ),
    );
  }
}

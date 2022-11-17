import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mc_crud_test/config/app_theme.dart';
import 'package:mc_crud_test/core/data/data_source/local/customer_entity.dart';
import 'package:mc_crud_test/features/get_customers/presentation/bloc/delete_bloc/delete_customer_bloc.dart';
import 'package:mc_crud_test/features/update_customer/presentation/screens/update_customer.dart';

import '../bloc/customer_list_bloc/customers_bloc.dart';

class CustomerList extends StatelessWidget {
  List<CustomerEntity> customerList;

  CustomerList({required this.customerList, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: SingleChildScrollView(
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: customerList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(2.0),
              child: Card(
                elevation: 16,
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: CircleAvatar(
                        backgroundColor: secondaryLightColor,
                        radius: 24,
                        child: Icon(
                          Icons.person,
                          size: 24,
                        ),
                        //Text
                      ),
                    ), //CircleAvatar
                    Expanded(
                      flex: 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${customerList[index].firstName!}   ${customerList[index].lastName!}",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 4, bottom: 4, right: 2),
                            child: Container(
                              width: double.infinity,
                              child: Text(
                                customerList[index].email!,
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                        child: IconButton(
                      icon: const Icon(Icons.edit),
                      color: Theme.of(context).iconTheme.color,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UpdateCustomerScreen(
                                customerEntity: customerList[index]),
                          ),
                        );
                      },
                    )),
                    Expanded(
                      child: IconButton(
                        icon: const Icon(Icons.delete),
                        color: Theme.of(context).iconTheme.color,
                        onPressed: () {
                          BlocProvider.of<DeleteCustomerBloc>(context).add(
                              DeleteCustomerEvent(customerList[index]));
                          BlocProvider.of<CustomerListBloc>(context)
                              .add(GetAllCustomersEvent());
                        },
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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mc_crud_test/app/app_routes.dart';
import 'package:mc_crud_test/features/customer/presentation/customerList/bloc/customer_list.bloc.dart';
import 'package:mc_crud_test/features/customer/presentation/customerList/bloc/customer_list.state.dart';
import 'package:mc_crud_test/features/customer/presentation/customerList/widgets/customer_list_empty.widget.dart';
import 'package:mc_crud_test/features/customer/presentation/customerList/widgets/customer_list_error.widget.dart';
import 'package:mc_crud_test/features/customer/presentation/customerList/widgets/customer_list_item.widget.dart';
import 'package:mc_crud_test/features/customer/presentation/customerList/widgets/customer_list_loading.widget.dart';

class CustomerListPage extends StatelessWidget {
  const CustomerListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Customer List"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.addCustomer);
        },
        child: const Icon(Icons.add),
        tooltip: "Add a new customer",
      ),
      body: BlocBuilder<CustomerListBloc, CustomerListState>(
        builder: (context, state) {
          if (state is Empty) {
            return const CustomerListEmptyWidget();
          } else if (state is Loading) {
            return const CustomerListLoadingWidget();
          } else if (state is ListLoaded) {
            return ListView.builder(
                itemCount: state.customers.length,
                itemBuilder: (context, index) {
                  return CustomerListItem(
                    customer: state.customers[index],
                    index: index,
                    key: Key("CustomerItem-$index"),
                  );
                });
          } else if (state is Error) {
            return CustomerListErrorWidget(state.message);
          } else {
            return const Center(
              child: Text("Unknown"),
            );
          }
        },
      ),
    );
  }
}

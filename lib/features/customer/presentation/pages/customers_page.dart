import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mc_crud_test/features/customer/domain/entities/create_customer/params/customer/customer.dart';
import 'package:mc_crud_test/features/customer/domain/entities/get_customers/params/get_customers_params.dart';
import 'package:mc_crud_test/features/customer/presentation/controllers/get_customers/cubit.dart';
import 'package:mc_crud_test/features/customer/presentation/widget/customer_form.dart';

import '../../../../core/di/di.dart';
import '../controllers/get_customers/state.dart';
import '../widget/customer.dart';

class CustomersPage extends StatefulWidget {
  const CustomersPage({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomersPage> createState() => _CustomersPageState();
}

class _CustomersPageState extends State<CustomersPage> {
  late GetCustomersCubit _getCustomersCubit;
  List<Customer> customers = [];

  @override
  void initState() {
    _getCustomersCubit = sl<GetCustomersCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        floatingActionButton: _newCustomerButton(context),
        body: _customerItems(),
      );

  BlocProvider<GetCustomersCubit> _customerItems() {
    return BlocProvider(
      create: (context) =>
          _getCustomersCubit..getCustomersF(GetCustomersParams()),
      child: BlocConsumer<GetCustomersCubit, GetCustomersState>(
        listener: (context, state) => state.maybeWhen(
          orElse: () => null,
          done: (response) => setState(() => customers = response.customers),
          error: (failure) => _showSnack(failure.errorReason),
        ),
        builder: (context, state) => state.maybeWhen(
          orElse: () => const SizedBox(),
          done: (response) => Column(
            children: [
              for (Customer customer in customers)
                CustomerWidget(
                  customer: customer,
                  onEdit: _showCustomerForm,
                  onDeleteCustomer: (customer) => setState(
                    () => customers.remove(customer),
                  ),
                ),
            ],
          ),
          error: (failure) => Text(failure.errorReason),
        ),
      ),
    );
  }

  void _showSnack(String message) => ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );

  Widget _newCustomerButton(BuildContext context) => SizedBox.square(
        dimension: 60,
        child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
            ),
          ),
          child: const Icon(Icons.add),
          onPressed: () => _showCustomerForm(),
        ),
      );

  void _showCustomerForm({Customer? customer}) => showModalBottomSheet(
        context: context,
        builder: (context) => CustomerForm(
          onSubmitCustomer: (newCustomer) => setState(
            () => customer != null

                /// update customers list if customer has been updated.
                ? _updateCustomersList(customer, newCustomer)

                /// add new customer to customers list.
                : customers.add(newCustomer),
          ),
          customer: customer,
        ),
      );

  void _updateCustomersList(Customer customer, Customer updatedCustomer) =>
      customers[customers.indexOf(customer)] = updatedCustomer;
}

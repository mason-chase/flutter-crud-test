import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mc_crud_test/core/di/di.dart';
import 'package:mc_crud_test/features/customer/domain/entities/create_customer/params/customer/customer.dart';
import 'package:mc_crud_test/features/customer/domain/entities/delete_customer/params/delete_customer_params.dart';
import 'package:mc_crud_test/features/customer/presentation/controllers/delete_customer/cubit.dart';

import '../controllers/delete_customer/state.dart';

class CustomerWidget extends StatefulWidget {
  const CustomerWidget({
    Key? key,
    required this.customer,
    required this.onDeleteCustomer,
    required this.onEdit,
  }) : super(key: key);
  final Customer customer;
  final Function({required Customer customer}) onEdit;
  final Function( Customer customer) onDeleteCustomer;

  @override
  State<CustomerWidget> createState() => _CustomerWidgetState();
}

class _CustomerWidgetState extends State<CustomerWidget> {
  late DeleteCustomerCubit _deleteCustomerCubit;

  @override
  void initState() {
    _deleteCustomerCubit = sl<DeleteCustomerCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.customer.email),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () => widget.onEdit(customer: widget.customer),
                  icon: const Icon(Icons.edit),
                ),
                const SizedBox(width: 24),
                BlocProvider(
                  create: (context) => _deleteCustomerCubit,
                  child: BlocConsumer<DeleteCustomerCubit, DeleteCustomerState>(
                    listener: (context, state) => state.maybeWhen(
                      orElse: () => null,
                      error: (failure) => _showSnack(failure.errorReason),
                      done: (response) {
                        widget.onDeleteCustomer(widget.customer);
                        return;
                      },
                    ),
                    builder: (context, state) => IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () => _deleteCustomerCubit.deleteCustomerF(
                        DeleteCustomerParams(widget.customer.id!),
                      ),
                      icon: const Icon(Icons.delete_forever),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );

  void _showSnack(String message) => ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/di.dart';
import '../../../../core/helpers/utils.dart';
import '../../domain/entities/create_customer/params/customer/customer.dart';
import '../../domain/entities/delete_customer/params/delete_customer_params.dart';
import '../controllers/delete_customer/cubit.dart';
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
  final Function(Customer customer) onDeleteCustomer;

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
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Colors.grey.shade200,
        ),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _info('E-mail:', widget.customer.email),
            _info('First name:', widget.customer.firstName),
            _info('Last name:', widget.customer.lastName),
            _info('Phone:', widget.customer.phoneNumber),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  constraints:
                      const BoxConstraints(maxHeight: 24, maxWidth: 24),
                  padding: EdgeInsets.zero,
                  onPressed: () => widget.onEdit(customer: widget.customer),
                  icon: const Icon(
                    Icons.edit,
                    size: 22,
                    color: Colors.blueGrey,
                  ),
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
                      constraints:
                          const BoxConstraints(maxHeight: 24, maxWidth: 24),
                      padding: EdgeInsets.zero,
                      onPressed: () => _deleteCustomerCubit.deleteCustomerF(
                        DeleteCustomerParams(widget.customer.id!),
                      ),
                      icon: const Icon(
                        Icons.delete_forever,
                        color: Colors.red,
                        size: 22,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );

  void _showSnack(String errorReason) =>
      sl<Utils>().showSnack(context, errorReason);

  Widget _info(String label, String value) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: Row(
          children: [
            SizedBox(width: 100, child: Text(label)),
            const SizedBox(width: 12),
            Text(value),
          ],
        ),
      );
}

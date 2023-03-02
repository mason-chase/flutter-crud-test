import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mc_crud_test/core/error/custom_toast.dart';
import 'package:mc_crud_test/core/services/service_locator.dart';
import 'package:mc_crud_test/custom_navigator.dart';
import 'package:mc_crud_test/features/customer/presentation/bloc/customer_bloc.dart';
import 'package:mc_crud_test/features/customer/presentation/bloc/customer_event.dart';
import 'package:mc_crud_test/features/customer/presentation/pages/add_or_edit_customer_page.dart';
import 'package:mc_crud_test/features/customer/presentation/widgets/custom_button.dart';
import '../../domain/entities/customer.dart';
import '../bloc/customer_state.dart';

class CustomerBottomSheet {
  final BuildContext context;

  CustomerBottomSheet(this.context);

  Future<void> show(Customer model) async {
    return await showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => _CustomerBottomSheet(model: model),
    );
  }
}

class _CustomerBottomSheet extends StatefulWidget {
  final Customer model;

  const _CustomerBottomSheet({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  State<_CustomerBottomSheet> createState() => _CustomerBottomSheetState();
}

class _CustomerBottomSheetState extends State<_CustomerBottomSheet> {
  final CustomerBloc _customerBloc = inject();

  @override
  void dispose() {
    _customerBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Expanded(
              child: CustomButton(
                title: "Edit",
                onTap: () async {
                  await CustomNavigator.pushNamed(
                    AddOrEditCustomerPage.routeName,
                    arguments: {"model": widget.model},
                  );
                  CustomNavigator.pop();
                },
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: BlocProvider(
                create: (context) => _customerBloc,
                child: BlocListener<CustomerBloc, CustomerState>(
                  listener: (context, state) {
                    state.whenOrNull(
                      error: (message, isLoading) {
                        CustomToast.toast(context, message);
                      },
                      successDeleted: (isLoading) {
                        CustomToast.toast(context, "This customer deleted.");
                        CustomNavigator.pop();
                      },
                    );
                  },
                  child: CustomButton(
                    title: "Delete",
                    color: Colors.redAccent,
                    onTap: () {
                      _customerBloc.add(
                        CustomerEvent.deleteCustomer(
                          widget.model.email,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

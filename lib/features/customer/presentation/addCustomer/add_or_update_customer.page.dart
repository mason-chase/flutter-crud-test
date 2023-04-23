import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mc_crud_test/core/models/app_form_state.enum.dart';
import 'package:mc_crud_test/core/models/status.enum.dart';
import 'package:mc_crud_test/features/app/widgets/custom_button.dart';
import 'package:mc_crud_test/features/customer/domain/customer.entity.dart';
import 'package:mc_crud_test/features/customer/presentation/addCustomer/add_customer_form_keys.dart';
import 'package:mc_crud_test/features/customer/presentation/addCustomer/bloc/add_customer.bloc.dart';
import 'package:mc_crud_test/features/customer/presentation/addCustomer/bloc/add_customer.event.dart';
import 'package:mc_crud_test/features/customer/presentation/addCustomer/bloc/add_customer.state.dart';
import 'package:mc_crud_test/features/customer/presentation/addCustomer/widgets/add_customer_form.widget.dart';

class AddOrUpdateCustomerPage extends StatefulWidget {
  const AddOrUpdateCustomerPage({Key? key, this.initialCustomer})
      : super(key: key);
  final Customer? initialCustomer;

  @override
  State<AddOrUpdateCustomerPage> createState() =>
      _AddOrUpdateCustomerPageState();
}

class _AddOrUpdateCustomerPageState extends State<AddOrUpdateCustomerPage> {
  @override
  void initState() {
    if (widget.initialCustomer != null) {
      BlocProvider.of<AddCustomerBloc>(context).add(
        AddCustomer(
          widget.initialCustomer!,
        ),
      );
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add a new Customer"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: AddCustomerFormWidget(
                  initialCustomer: widget.initialCustomer,
                ),
              ),
            ),
            BlocListener<AddCustomerBloc, AddCustomerState>(
              listener: (BuildContext context, state) {
                if (state.status == Status.error) {
                  var snackBar = SnackBar(
                    content: Text(state.errorMessage ?? ''),
                    backgroundColor: Colors.redAccent,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                } else if (state.status == Status.success) {
                  var snackBar = SnackBar(
                    content: Text(widget.initialCustomer != null
                        ? "Customer updated successfully"
                        : "Customer added successfully"),
                    backgroundColor: Colors.greenAccent,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);

                  Timer(const Duration(milliseconds: 400), () {
                    // pop to previous screen
                    Navigator.pop(context);
                  });
                }
              },
              child: BlocBuilder<AddCustomerBloc, AddCustomerState>(
                buildWhen: (p, c) => p != c,
                builder: (context, _) {
                  return CustomButton(
                    key: AddCustomerFormKeys.submitButtonKey,
                    loading: context.read<AddCustomerBloc>().state.status ==
                        Status.loading,
                    title: "Submit",
                    enable: context.read<AddCustomerBloc>().state.formState ==
                        AppFormState.valid,
                    onTap: () {
                      context.read<AddCustomerBloc>().add(
                            AddOrUpdateCustomer(),
                          );
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

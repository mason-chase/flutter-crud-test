import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mc_crud_test/features/app/widgets/custom_form_text_field.dart';
import 'package:mc_crud_test/features/app/widgets/date_picker.widget.dart';
import 'package:mc_crud_test/features/customer/domain/customer.entity.dart';
import 'package:mc_crud_test/features/customer/presentation/addCustomer/add_customer_form_keys.dart';
import 'package:mc_crud_test/features/customer/presentation/addCustomer/bloc/add_customer.bloc.dart';
import 'package:mc_crud_test/features/customer/presentation/addCustomer/bloc/add_customer.event.dart';
import 'package:mc_crud_test/features/customer/presentation/addCustomer/bloc/add_customer.state.dart';

class AddCustomerFormWidget extends StatefulWidget {
  const AddCustomerFormWidget({Key? key, this.initialCustomer})
      : super(key: key);
  final Customer? initialCustomer;

  @override
  State<AddCustomerFormWidget> createState() => _AddCustomerFormWidgetState();
}

class _AddCustomerFormWidgetState extends State<AddCustomerFormWidget> {
  late List<FocusNode> _focusNodes;
  final int textFieldLength = 5;

  @override
  void initState() {
    super.initState();
    _focusNodes = List.generate(textFieldLength, (index) => FocusNode());
  }

  @override
  void dispose() {
    for (final element in _focusNodes) {
      element.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddCustomerBloc, AddCustomerState>(
      listenWhen: (p, c) => p != c,
      listener: (context, state) {},
      child: BlocBuilder<AddCustomerBloc, AddCustomerState>(
        buildWhen: (p, c) => p != c,
        builder: (context, _) {
          return Form(
            autovalidateMode: AutovalidateMode.always,
            child: Column(
              children: [
                CustomFormTextField(
                  key: AddCustomerFormKeys.firstNameKey,
                  onChange: (value) => context.read<AddCustomerBloc>().add(
                        FirstnameChanged(value),
                      ),
                  initialValue: widget.initialCustomer?.firstname,
                  title: 'First name',
                  size: TextFieldSize.medium,
                  currentFocusNode: _focusNodes[0],
                  nextFocusNode: _focusNodes[1],
                  textInputType: TextInputType.name,
                  maxLength:
                      context.read<AddCustomerBloc>().state.firstname.maxLength,
                  validator: (_) => context
                      .read<AddCustomerBloc>()
                      .state
                      .firstname
                      .errorMessage,
                ),
                CustomFormTextField(
                  key: AddCustomerFormKeys.lastNameKey,
                  onChange: (value) => context.read<AddCustomerBloc>().add(
                        LastnameChanged(value),
                      ),
                  initialValue: widget.initialCustomer?.lastname,
                  title: 'Last name',
                  currentFocusNode: _focusNodes[1],
                  nextFocusNode: _focusNodes[2],
                  textInputType: TextInputType.name,
                  maxLength:
                      context.read<AddCustomerBloc>().state.lastname.maxLength,
                  validator: (_) => context
                      .read<AddCustomerBloc>()
                      .state
                      .lastname
                      .errorMessage,
                ),
                CustomFormTextField(
                  key: AddCustomerFormKeys.emailKey,
                  onChange: (value) => context.read<AddCustomerBloc>().add(
                        EmailChanged(value),
                      ),
                  initialValue: widget.initialCustomer?.email,
                  title: 'Email',
                  currentFocusNode: _focusNodes[2],
                  nextFocusNode: _focusNodes[3],
                  textInputType: TextInputType.emailAddress,
                  maxLength:
                      context.read<AddCustomerBloc>().state.email.maxLength,
                  validator: (_) =>
                      context.read<AddCustomerBloc>().state.email.errorMessage,
                ),
                CustomFormTextField(
                  key: AddCustomerFormKeys.phoneKey,
                  onChange: (value) => context.read<AddCustomerBloc>().add(
                        PhoneChanged(value),
                      ),
                  initialValue: widget.initialCustomer?.phoneNumber,
                  title: 'Phone',
                  currentFocusNode: _focusNodes[3],
                  nextFocusNode: _focusNodes[4],
                  textInputType: TextInputType.phone,
                  maxLength:
                      context.read<AddCustomerBloc>().state.phone.maxLength,
                  validator: (_) =>
                      context.read<AddCustomerBloc>().state.phone.errorMessage,
                ),
                CustomFormTextField(
                  key: AddCustomerFormKeys.bankAccountKey,
                  onChange: (value) => context.read<AddCustomerBloc>().add(
                        BankAccountChanged(value),
                      ),
                  initialValue: widget.initialCustomer?.bankAccountNumber,
                  title: 'Bank account',
                  currentFocusNode: _focusNodes[4],
                  textInputType: TextInputType.number,
                  maxLength: context
                      .read<AddCustomerBloc>()
                      .state
                      .bankAccount
                      .maxLength,
                  validator: (_) => context
                      .read<AddCustomerBloc>()
                      .state
                      .bankAccount
                      .errorMessage,
                ),
                DatePickerWidget(
                  key: AddCustomerFormKeys.dateOfBirthKey,
                  initialDateTime: widget.initialCustomer?.dateOfBirth,
                  onDateChange: (date) {
                    context.read<AddCustomerBloc>().add(
                          DateOfBirthChanged(date),
                        );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

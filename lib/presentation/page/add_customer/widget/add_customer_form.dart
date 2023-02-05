import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mc_crud_test/application/customer/add_customer/add_customer_bloc.dart';
import 'package:mc_crud_test/application/customer/get_all_customer/get_all_customer_cubit.dart';
import 'package:mc_crud_test/domain/core/value_objects.dart';
import 'package:mc_crud_test/domain/shared/enum/flush_bar_type_enum.dart';
import 'package:mc_crud_test/injection.dart';
import 'package:mc_crud_test/presentation/widget/date_selector.dart';
import 'package:mc_crud_test/presentation/widget/flushybar.dart';
import 'package:mc_crud_test/presentation/widget/text_field/custom_form_text_field.dart';
import 'package:mc_crud_test/presentation/widget/text_field/custom_text_field_formatter.dart';

class AddCustomerForm extends StatefulWidget {
  const AddCustomerForm({Key? key}) : super(key: key);

  @override
  State<AddCustomerForm> createState() => _AddCustomerFormState();
}

class _AddCustomerFormState extends State<AddCustomerForm> {
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
      listenWhen: (p, c) => p.addCustomerFailureOrSuccess != c.addCustomerFailureOrSuccess,
      listener: (context, state) {
        state.addCustomerFailureOrSuccess.fold(
          () {},
          (data) => data.fold(
            (failure) => getIt<FlushyBar>().showFlushyBar(
              context: context,
              title: failure.errorMessage,
              flushBarType: FlushBarType.error,
            ),
            (success) {
              getIt<FlushyBar>().showFlushyBar(
                context: context,
                title: "Customer successfully added.",
                flushBarType: FlushBarType.success,
                onActionAfterDismiss: () {
                  context.read<GetAllCustomerCubit>().getAllCustomer();
                  context.pop();
                },
              );
            },
          ),
        );
      },
      child: Column(
        children: [
          BlocBuilder<AddCustomerBloc, AddCustomerState>(
            buildWhen: (p, c) => p.showErrorMessages != c.showErrorMessages,
            builder: (context, state) {
              return Form(
                autovalidateMode:
                    state.showErrorMessages ? AutovalidateMode.always : AutovalidateMode.disabled,
                child: Column(
                  children: [
                    CustomFormTextField(
                      onChange: (value) => context.read<AddCustomerBloc>().add(
                            AddCustomerEvent.firstNameChanged(value),
                          ),
                      title: 'First name',
                      currentFocusNode: _focusNodes[0],
                      nextFocusNode: _focusNodes[1],
                      maxLength: MandatoryValue.maxLength,
                      validator: (_) =>
                          context.read<AddCustomerBloc>().state.firstName.mandatoryValueError(
                                fieldName: 'First name',
                              ),
                    ),
                    CustomFormTextField(
                      onChange: (value) => context.read<AddCustomerBloc>().add(
                            AddCustomerEvent.lastNameChanged(value),
                          ),
                      title: 'Last name',
                      maxLength: MandatoryValue.maxLength,
                      currentFocusNode: _focusNodes[1],
                      nextFocusNode: _focusNodes[2],
                      validator: (_) =>
                          context.read<AddCustomerBloc>().state.lastName.mandatoryValueError(
                                fieldName: 'Last name',
                              ),
                    ),
                    CustomFormTextField(
                      onChange: (value) => context.read<AddCustomerBloc>().add(
                            AddCustomerEvent.phoneNumberChanged(value),
                          ),
                      title: 'Phone number',
                      textInputType: TextInputType.phone,
                      currentFocusNode: _focusNodes[2],
                      nextFocusNode: _focusNodes[3],
                      validator: (_) =>
                          context.read<AddCustomerBloc>().state.phoneNumber.phoneNumberError,
                    ),
                    CustomFormTextField(
                      onChange: (value) => context.read<AddCustomerBloc>().add(
                            AddCustomerEvent.emailChanged(value),
                          ),
                      title: 'Email',
                      textInputType: TextInputType.emailAddress,
                      currentFocusNode: _focusNodes[3],
                      nextFocusNode: _focusNodes[4],
                      validator: (_) => context.read<AddCustomerBloc>().state.email.emailError,
                    ),
                    CustomFormTextField(
                      onChange: (value) => context.read<AddCustomerBloc>().add(
                            AddCustomerEvent.bankAccountNumberChanged(value),
                          ),
                      title: 'Bank account number',
                      textInputType: TextInputType.number,
                      maxLength: 19,
                      currentFocusNode: _focusNodes[4],
                      inputFormatter: [
                        LengthLimitingTextInputFormatter(19),
                        FilteringTextInputFormatter.digitsOnly,
                        CardNumberTextFieldFormatter()
                      ],
                      validator: (_) => context
                          .read<AddCustomerBloc>()
                          .state
                          .bankAccountNumber
                          .bankAccountNumberError,
                    ),
                    const DateSelector(),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

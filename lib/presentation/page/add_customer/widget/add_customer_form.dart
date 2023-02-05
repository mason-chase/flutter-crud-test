import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mc_crud_test/application/customer/add_customer/add_customer_bloc.dart';
import 'package:mc_crud_test/domain/core/value_objects.dart';
import 'package:mc_crud_test/presentation/widget/button_with_label.dart';
import 'package:mc_crud_test/presentation/widget/text_field/custom_form_text_field.dart';
import 'package:mc_crud_test/presentation/widget/text_field/custom_text_field_formatter.dart';

class AddCustomerForm extends StatelessWidget {
  const AddCustomerForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
                    validator: (_) =>
                        context.read<AddCustomerBloc>().state.lastName.mandatoryValueError(
                              fieldName: 'Last name',
                            ),
                  ),
                  ButtonWithLabel(
                    title: 'Date of birth',
                    data: '',
                    onPressed: () {},
                  ),
                  CustomFormTextField(
                    onChange: (value) => context.read<AddCustomerBloc>().add(
                          AddCustomerEvent.phoneNumberChanged(value),
                        ),
                    title: 'Phone number',
                    textInputType: TextInputType.number,
                    validator: (_) =>
                        context.read<AddCustomerBloc>().state.phoneNumber.phoneNumberError,
                  ),
                  CustomFormTextField(
                    onChange: (value) => context.read<AddCustomerBloc>().add(
                          AddCustomerEvent.emailChanged(value),
                        ),
                    title: 'Email',
                    textInputType: TextInputType.emailAddress,
                    validator: (_) => context.read<AddCustomerBloc>().state.email.emailError,
                  ),
                  CustomFormTextField(
                    onChange: (value) => context.read<AddCustomerBloc>().add(
                          AddCustomerEvent.bankAccountNumberChanged(value),
                        ),
                    title: 'Bank account number',
                    textInputType: TextInputType.number,
                    maxLength: 19,
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
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}

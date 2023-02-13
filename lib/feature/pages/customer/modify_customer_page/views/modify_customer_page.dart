import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../shared_library/infrastructure/utils/theme_utils.dart';
import '../../../../../shared_library/infrastructure/utils/utils.dart';
import '../../../../../shared_library/views/custom_app_bar.dart';
import '../../../../../shared_library/views/fill_button.dart';
import '../../../../../shared_library/views/max_body_widget.dart';
import '../../../../../shared_library/views/select_date_widget.dart';
import '../controllers/modify_customer_base_controller.dart';

class ModifyCustomerPage<T extends ModifyCustomerBaseController>
    extends GetView<T> {
  const ModifyCustomerPage({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) => Scaffold(
        appBar: const CustomAppBar(),
        body: MaxWidthWidget(
          child: Padding(
            padding: Utils.smallPadding,
            child: SingleChildScrollView(
              child: Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    Utils.mediumVerticalSpace,
                    _firstName(),
                    Utils.mediumVerticalSpace,
                    _lastName(),
                    Utils.mediumVerticalSpace,
                    _mobileNumber(),
                    Utils.mediumVerticalSpace,
                    _email(),
                    Utils.mediumVerticalSpace,
                    _accountNumber(),
                    Utils.mediumVerticalSpace,
                    SelectDateWidget(
                      onDateSelected: (final value) {
                        controller.selectedDate = value;
                      },
                    ),
                    Utils.mediumVerticalSpace,
                    _submit(),
                  ],
                ),
              ),
            ),
          ),
        ),
      );

  Widget _submit() => FillButton(
        onPressed: controller.modifyCustomer,
        title: 'Submit',
      );

  Widget _accountNumber() => TextFormField(
        validator: Utils.validateBankAccountNumber,
        keyboardType: TextInputType.number,
        controller: controller.accountNumberController,
        decoration:
            ThemeUtils.textFormFieldDecoration(label: 'Bank Account Number'),
      );

  Widget _email() => TextFormField(
        validator: Utils.validateEmail,
        controller: controller.emailController,
        keyboardType: TextInputType.emailAddress,
        decoration: ThemeUtils.textFormFieldDecoration(label: 'Email Address'),
      );

  Widget _mobileNumber() => TextFormField(
        validator: Utils.validateMobile,
        controller: controller.mobileNumberController,
        maxLength: 11,
        keyboardType: TextInputType.number,
        decoration: ThemeUtils.textFormFieldDecoration(label: 'Mobile Number'),
      );

  Widget _lastName() => TextFormField(
        validator: Utils.validateText,
        controller: controller.lastNameController,
        decoration: ThemeUtils.textFormFieldDecoration(label: 'Last Name'),
      );

  Widget _firstName() => TextFormField(
        validator: Utils.validateText,
        controller: controller.firstNameController,
        decoration: ThemeUtils.textFormFieldDecoration(label: 'First Name'),
      );
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mc_crud_test/core/error/custom_toast.dart';
import 'package:mc_crud_test/core/helper/helper_extension.dart';
import 'package:mc_crud_test/core/services/service_locator.dart';
import 'package:mc_crud_test/custom_navigator.dart';
import 'package:mc_crud_test/features/customer/domain/entities/customer.dart';
import 'package:mc_crud_test/features/customer/presentation/bloc/customer_bloc.dart';
import 'package:mc_crud_test/features/customer/presentation/widgets/closable_keyboard.dart';
import 'package:mc_crud_test/features/customer/presentation/widgets/custom_button.dart';
import 'package:mc_crud_test/features/customer/presentation/widgets/custom_input.dart';
import '/core/helper/input_formatters.dart';
import '../bloc/customer_event.dart';
import '../bloc/customer_state.dart';

class AddOrEditCustomerPage extends StatefulWidget {
  final Customer? model;
  static const String routeName = "addOrEditCustomerPage";

  const AddOrEditCustomerPage({Key? key, this.model}) : super(key: key);

  @override
  State<AddOrEditCustomerPage> createState() => _AddOrEditCustomerPageState();
}

class _AddOrEditCustomerPageState extends State<AddOrEditCustomerPage> {
  final CustomerBloc _customerBloc = inject();

  final _emailController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _birthdayController = TextEditingController();
  final _bankNumberController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autoValidate = AutovalidateMode.disabled;

  void _validateInputs() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
    } else {
      setState(() {
        _autoValidate = AutovalidateMode.always;
      });
    }
  }

  @override
  void initState() {
    if (widget.model != null) {
      _emailController.text = widget.model!.email;
      _firstNameController.text = widget.model!.firstname;
      _lastNameController.text = widget.model!.lastname;
      _phoneNumberController.text = widget.model!.phoneNumber;
      _birthdayController.text = widget.model!.dateOfBirth;
      _bankNumberController.text = widget.model!.bankAccountNumber;
    }
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneNumberController.dispose();
    _birthdayController.dispose();
    _bankNumberController.dispose();
    _customerBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClosableKeyBoard(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.model != null
              ? "Edit the Customer"
              : "Add a new Customer"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              autovalidateMode: _autoValidate,
              child: Column(
                children: [
                  if (widget.model == null)
                    CustomInput(
                      controller: _emailController,
                      type: TextInputType.emailAddress,
                      hint: "Email",
                      validator: (value) {
                        return value.isValidEmail ? null : "Email is not valid";
                      },
                    ),
                  CustomInput(
                    controller: _firstNameController,
                    hint: "First name",
                    validator: (value) {
                      return value.isNotNull ? null : "First name is not valid";
                    },
                  ),
                  CustomInput(
                    controller: _lastNameController,
                    hint: "Last name",
                    validator: (value) {
                      return value.isNotNull ? null : "Last name is not valid";
                    },
                  ),
                  CustomInput(
                    controller: _phoneNumberController,
                    hint: "Phone number",
                    type: TextInputType.phone,
                    maxLength: 11,
                    validator: (value) {
                      return value.isValidPhone
                          ? null
                          : "Phone number is not valid";
                    },
                  ),
                  CustomInput(
                    controller: _birthdayController,
                    hint: "Birthday",
                    type: TextInputType.phone,
                    validator: (value) {
                      return value.isValidDate ? null : "Birthday is not valid";
                    },
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      DateInputFormatter(),
                      LengthLimitingTextInputFormatter(10),
                    ],
                  ),
                  CustomInput(
                    controller: _bankNumberController,
                    action: TextInputAction.done,
                    hint: "Bank account number",
                    type: TextInputType.number,
                    validator: (value) {
                      return value.isValidBank
                          ? null
                          : "Bank account number is not valid";
                    },
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      CardInputFormatter(),
                      LengthLimitingTextInputFormatter(19),
                    ],
                  ),
                  BlocProvider(
                    create: (context) => _customerBloc,
                    child: BlocListener<CustomerBloc, CustomerState>(
                      listenWhen: (previous, current) {
                        return current.maybeWhen(
                          orElse: () => false,
                          error: (message, isLoading) => true,
                          successEdited: (data, isLoading) => true,
                          successAdded: (data, isLoading) => true,
                        );
                      },
                      listener: (context, state) {
                        state.whenOrNull(
                          error: (message, isLoading) {
                            CustomToast.toast(context, message);
                          },
                          successEdited: (data, isLoading) {
                            CustomNavigator.pop();
                            CustomToast.toast(
                              context,
                              "${data.email} Edited.",
                            );
                          },
                          successAdded: (data, isLoading) {
                            CustomNavigator.pop();
                            CustomToast.toast(
                              context,
                              "Added a new customer with email ${data.email}",
                            );
                          },
                        );
                      },
                      child: CustomButton(
                        title: "Submit",
                        onTap: () {
                          ClosableKeyBoard.close(context);
                          if (!_formKey.currentState!.validate()) {
                            _validateInputs();
                          } else {
                            if (widget.model != null) {
                              _customerBloc.add(
                                CustomerEvent.editCustomer(
                                  Customer(
                                    email: _emailController.text,
                                    firstname: _firstNameController.text,
                                    lastname: _lastNameController.text,
                                    phoneNumber: _phoneNumberController.text,
                                    bankAccountNumber:
                                        _bankNumberController.text,
                                    dateOfBirth: _birthdayController.text,
                                  ),
                                ),
                              );
                            } else {
                              _customerBloc.add(
                                CustomerEvent.addCustomer(
                                  Customer(
                                    email: _emailController.text,
                                    firstname: _firstNameController.text,
                                    lastname: _lastNameController.text,
                                    phoneNumber: _phoneNumberController.text,
                                    bankAccountNumber:
                                        _bankNumberController.text,
                                    dateOfBirth: _birthdayController.text,
                                  ),
                                ),
                              );
                            }
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

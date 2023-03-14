import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/di/di.dart';
import '../../../../core/helpers/utils.dart';
import '../../../../core/widgets/custom_input.dart';
import '../../domain/entities/create_customer/params/create_customer_params.dart';
import '../../domain/entities/create_customer/params/customer/customer.dart';
import '../../domain/entities/update_customer/params/update_customer_params.dart';
import '../controllers/create_customer/cubit.dart';
import '../controllers/create_customer/state.dart';
import '../controllers/update_customer/cubit.dart';
import '../controllers/update_customer/state.dart';
import 'phone_number_validation.dart';

class CustomerForm extends StatefulWidget {
  const CustomerForm({
    Key? key,
    required this.onSubmitCustomer,
    this.customer,
  }) : super(key: key);

  final Function(Customer customer) onSubmitCustomer;
  final Customer? customer;

  @override
  State<CustomerForm> createState() => _CustomerFormState();
}

class _CustomerFormState extends State<CustomerForm> {
  late CreateCustomerCubit _createCustomerCubit;
  late UpdateCustomerCubit _updateCustomerCubit;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController firstNameController = TextEditingController(),
      lastNameController = TextEditingController(),
      phoneNumberController = TextEditingController(),
      bankAccountNumberController = TextEditingController(),
      emailController = TextEditingController(),
      dateOfBirthController = TextEditingController();

  DateTime? pickedDate;

  @override
  void initState() {
    _createCustomerCubit = sl<CreateCustomerCubit>();
    _updateCustomerCubit = sl<UpdateCustomerCubit>();
    if (widget.customer != null) _setDefaultValues();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(24),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 24),
                    _closeButton(),
                    const SizedBox(height: 100),
                    CustomInput(
                      controller: firstNameController,
                      placeholder: 'First name',
                      validator: _nameValidator,
                    ),
                    CustomInput(
                      controller: lastNameController,
                      placeholder: 'Last name',
                      validator: _nameValidator,
                    ),
                    CustomInput(
                      controller: emailController,
                      placeholder: 'E-mail',
                      validator: _emailValidator,
                    ),
                    CustomInput(
                      placeholder: 'Phone',
                      controller: phoneNumberController,
                      readOnly: true,
                      onTap: _showPhoneNumbersModal,
                    ),
                    CustomInput(
                      placeholder: 'Bank account number',
                      controller: bankAccountNumberController,
                      validator: _bankNumberValidator,
                    ),
                    CustomInput(
                      controller: dateOfBirthController,
                      placeholder: 'Birth date',
                      readOnly: true,
                      onTap: _showDatePicker,
                    ),
                    const SizedBox(height: 56),
                    widget.customer == null ? _createButton() : _updateButton(),
                  ],
                ),
              ),
            ),
          ),
        ),
      );

  Widget _createButton() => BlocProvider(
        create: (context) => _createCustomerCubit,
        child: BlocConsumer<CreateCustomerCubit, CreateCustomerState>(
          listener: (context, state) => state.maybeWhen(
            orElse: () => null,
            error: (failure) => _showSnack(failure.errorReason),
            done: (response) {
              widget.onSubmitCustomer(response.customer);
              _showSnack('Successful!');
              Navigator.pop(context);
              return;
            },
          ),
          builder: (context, state) => SizedBox(
            width: 200,
            height: 48,
            child: ElevatedButton(
              child: const Text('create'),
              onPressed: () => _callCreate(context),
            ),
          ),
        ),
      );

  void _showDatePicker() async => await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1920),
        lastDate: DateTime(2030),
      ).then(
        (pickedDate) {
          if (pickedDate != null) {
            String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
            setState(() => dateOfBirthController.text = formattedDate);
          }
        },
      );

  void _callCreate(BuildContext context) {
    final validated = _formKey.currentState!.validate();
    if (validated) {
      _createCustomerCubit.createCustomerF(
        CreateCustomerParams(
          Customer(
            firstNameController.text,
            lastNameController.text,
            emailController.text,
            phoneNumberController.text,
            bankAccountNumberController.text,
            dateOfBirthController.text,
            const Uuid().v4(),
          ),
        ),
      );
    }
    _formKey.currentState!.save();
  }

  void _showPhoneNumbersModal() => showModalBottomSheet(
        isScrollControlled: false,
        context: context,
        builder: (context) => PhoneNumerValidation(
          phoneNumber: phoneNumberController.text,
          onSelectPhone: (phone) => phoneNumberController.text = phone,
        ),
      );

  String? _emailValidator(String? value) {
    if (value!.isEmpty || !sl<Utils>().isEmailValid(value))
      return 'Enter a valid email!';
    return null;
  }

  String? _bankNumberValidator(String? value) {
    if (value!.isEmpty) return 'Enter a valid bank account number!';
    return null;
  }

  String? _nameValidator(String? value) {
    if (value!.isEmpty) return 'Enter a valid Name!';
    return null;
  }

  void _setDefaultValues() {
    firstNameController.text = widget.customer!.firstName;
    lastNameController.text = widget.customer!.lastName;
    phoneNumberController.text = widget.customer!.phoneNumber;
    bankAccountNumberController.text = widget.customer!.bankAccountNumber;
    emailController.text = widget.customer!.email;
    dateOfBirthController.text = widget.customer!.dateOfBirth;
  }

  Widget _updateButton() => BlocProvider(
        create: (context) => _updateCustomerCubit,
        child: BlocConsumer<UpdateCustomerCubit, UpdateCustomerState>(
          listener: (context, state) => state.maybeWhen(
            orElse: () => null,
            error: (failure) => _showSnack(failure.errorReason),
            done: (response) {
              widget.onSubmitCustomer(response.customer);
              _showSnack('Updated!');
              Navigator.pop(context);
              return;
            },
          ),
          builder: (context, state) => SizedBox(
            width: 200,
            height: 48,
            child: ElevatedButton(
              child: const Text('Update'),
              onPressed: () => _callUpdate(context),
            ),
          ),
        ),
      );

  void _callUpdate(BuildContext context) {
    final validated = _formKey.currentState!.validate();
    if (validated) {
      _updateCustomerCubit.updateCustomerF(
        UpdateCustomerParams(
          Customer(
            firstNameController.text,
            lastNameController.text,
            emailController.text,
            phoneNumberController.text,
            bankAccountNumberController.text,
            dateOfBirthController.text,
            widget.customer!.id,
          ),
        ),
      );
    }
    _formKey.currentState!.save();
  }

  void _showSnack(String errorReason) =>
      sl<Utils>().showSnack(context, errorReason);

  Widget _closeButton() => Align(
        alignment: Alignment.centerRight,
        child: SizedBox(
          width: 48,
          height: 48,
          child: ElevatedButton(
            style: ButtonStyle(
              padding: MaterialStateProperty.all(EdgeInsets.zero),
              backgroundColor: MaterialStateProperty.all(Colors.grey),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
            onPressed: () => Navigator.pop(context),
            child: const Icon(Icons.close),
          ),
        ),
      );
}

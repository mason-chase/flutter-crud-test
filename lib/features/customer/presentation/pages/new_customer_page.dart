import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/di/di.dart';
import '../../../../core/helpers/validator.dart';
import '../../../../core/widgets/custom_input.dart';
import '../../domain/entities/create_customer/params/create_customer_params.dart';
import '../../domain/entities/create_customer/params/customer/customer.dart';
import '../controllers/create_customer/cubit.dart';
import '../controllers/create_customer/state.dart';
import '../widget/phone_number_validation.dart';

class NewCustomerPage extends StatefulWidget {
  const NewCustomerPage({
    Key? key,
  }) : super(key: key);

  @override
  State<NewCustomerPage> createState() => _NewCustomerPageState();
}

class _NewCustomerPageState extends State<NewCustomerPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late CreateCustomerCubit _createCustomerCubit;
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
                    _createButton(),
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
            done: (response) => _showSnack('Successful!'),
          ),
          builder: (context, state) => ElevatedButton(
            child: const Text('create'),
            onPressed: () => _callCreate(context),
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
    if (value!.isEmpty || !sl<Validator>().isEmailValid(value))
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

  void _showSnack(String message) => ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
}

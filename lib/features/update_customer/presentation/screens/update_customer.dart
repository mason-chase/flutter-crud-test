import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:mc_crud_test/core/utils/app_utils.dart';
import 'package:mc_crud_test/features/customer_list/presentation/screens/customers.dart';
import 'package:mc_crud_test/features/update_customer/presentation/bloc/update_customer_bloc.dart';
import 'package:mc_crud_test/locator.dart';

import '../../../../config/app_theme.dart';
import '../../../../core/data/data_source/local/customer_entity.dart';

class UpdateCustomerScreen extends StatefulWidget {
  CustomerEntity customerEntity;

  UpdateCustomerScreen({required this.customerEntity, Key? key})
      : super(key: key);

  @override
  State<UpdateCustomerScreen> createState() => _UpdateCustomerScreenState();
}

class _UpdateCustomerScreenState extends State<UpdateCustomerScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _bankAccountNumberController =
      TextEditingController();
  final TextEditingController _dateOfBirthController = TextEditingController();

  AppUtils appUtils = locator<AppUtils>();
  List<String> date = [];
  Logger logger = Logger(printer: PrettyPrinter());

  @override
  void initState() {
    super.initState();
    setData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundColor: secondaryLightColor,
                radius: 64,
                child: Image.asset("assets/images/edit_info.png"),
                //Text
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Card(
                child: TextField(
                  controller: _firstNameController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    labelText: 'First Name',
                    hintText: 'Enter Your First Name',
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Card(
                child: TextField(
                  controller: _lastNameController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    labelText: 'Last Name',
                    hintText: 'Enter Your Last Name',
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Card(child: datePickerWidget()),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Card(
                child: TextField(
                  controller: _phoneNumberController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.phone_android),
                    labelText: 'Phone Number',
                    hintText: 'Enter Your Phone Number',
                  ),
                ),
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Card(
                      child: TextField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          labelText: 'Email',
                          hintText: 'Enter Your Email',
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Card(
                      child: TextField(
                        controller: _bankAccountNumberController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.monetization_on),
                          labelText: 'Bank Account Number',
                          hintText: 'Enter Your Bank Account Number',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ElevatedButton.icon(
                      onPressed: () {
                        _submit();
                      },
                      icon: const Icon(Icons.save),
                      label: const Text("Save"),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.cancel),
                        label: const Text("Cancel"),
                        style: ElevatedButton.styleFrom(
                          primary: primaryDarkColor,
                        ),
                      )),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }

  Widget datePickerWidget() {
    return TextField(
      controller: _dateOfBirthController,
      decoration: const InputDecoration(
          prefixIcon: Icon(Icons.calendar_today), labelText: "Enter Date"),
      readOnly: true,
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.utc(
                int.parse(date[0]), int.parse(date[1]), int.parse(date[2])),
            firstDate: DateTime(1900),
            lastDate: DateTime(2101));
        if (pickedDate != null) {
          String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);

          setState(() {
            _dateOfBirthController.text = formattedDate;
          });
        } else {
          print("Date is not selected");
        }
      },
    );
  }

  void _submit() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    } else {
      BlocProvider.of<UpdateCustomerBloc>(context)
          .add(UpdateCustomerEvent(setCustomerInfo()));
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const AllCustomers()));
    }
    _formKey.currentState!.save();
  }

  CustomerEntity setCustomerInfo() {
    return CustomerEntity(
      id: widget.customerEntity.id,
      firstName: _firstNameController.text,
      lastName: _lastNameController.text,
      phoneNumber: _phoneNumberController.text,
      email: _emailController.text,
      dateOfBirth: _dateOfBirthController.text,
      bankAccountNumber: _bankAccountNumberController.text,
    );
  }

  setData() {
    _firstNameController.text = widget.customerEntity.firstName!;
    _lastNameController.text = widget.customerEntity.lastName!;
    _emailController.text = widget.customerEntity.email!;
    _bankAccountNumberController.text =
        widget.customerEntity.bankAccountNumber!;
    _phoneNumberController.text = widget.customerEntity.phoneNumber!;
    _dateOfBirthController.text = widget.customerEntity.dateOfBirth!;
    date = appUtils.splitDate(widget.customerEntity.dateOfBirth!);
  }

  @override
  void dispose() {
    _disposeTextController();
    super.dispose();
  }

  _disposeTextController() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneNumberController.dispose();
    _emailController.dispose();
    _bankAccountNumberController.dispose();
    _dateOfBirthController.dispose();
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_libphonenumber/flutter_libphonenumber.dart';
import 'package:mc_crud_test/core/customer/data/dto/customer_dto.dart';
import 'package:mc_crud_test/core/customer/domain/entity/customer_entity.dart';
import 'package:mc_crud_test/core/customer/domain/usecase/customer/get_customer_list_usecase.dart';
import 'package:mc_crud_test/feature/customer/bloc/customer_bloc.dart';
import 'package:mc_crud_test/feature/customer/widget/customer_button_widget.dart';

CustomerEntity? oldCustomerData;

class CustomerAddPage extends StatefulWidget {
  const CustomerAddPage({Key? key}) : super(key: key);

  @override
  State<CustomerAddPage> createState() => _CustomerAddPageState();
}

class _CustomerAddPageState extends State<CustomerAddPage> {
  DateTime selectedDate = DateTime.now();
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _dateOfBirthController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _bankAcountNumberController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final countryController = TextEditingController(text: 'United States');

  /// Used to format numbers as mobile or land line
  var _globalPhoneType = PhoneNumberType.mobile;

  /// Use international or national phone format
  var _globalPhoneFormat = PhoneNumberFormat.international;

  /// Current selected country
  var _currentSelectedCountry = const CountryWithPhoneCode.us();

  var _placeholderHint = '';

  var _inputContainsCountryCode = true;

  var _shouldKeepCursorAtEndOfInput = true;
  bool isUpdating = false;
  CustomerEntity? updatingCustomer;
  CustomerEntity? updatedCustomer;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        _dateOfBirthController.text =
            "${picked.year}/${picked.month}/${picked.day}";
      });
    }
  }

  Future<void> submitCustomer() async {
    CustomerDTO customerData;
    if (isUpdating == false) {
      customerData = CustomerDTO(
          firstName: _firstNameController.text,
          lastName: _lastNameController.text,
          dateOfBirth: _dateOfBirthController.text,
          phoneNumber: _phoneNumberController.text,
          email: _emailController.text,
          bankAcountNumber: _bankAcountNumberController.text);
      context.read<CustomerBloc>().add(AddCustomer(customerData: customerData));
    } else {
      int index = context.read<CustomerBloc>().state.selectedCustomerIndex;
      CustomerDTO oldCustomer = CustomerDTO(
          firstName: oldCustomerData?.firstName,
          lastName: oldCustomerData?.lastName,
          dateOfBirth: oldCustomerData?.dateOfBirth,
          phoneNumber: oldCustomerData?.phoneNumber,
          email: oldCustomerData?.email,
          bankAcountNumber: oldCustomerData?.bankAcountNumber);
      customerData = CustomerDTO(
          firstName: _firstNameController.text,
          lastName: _lastNameController.text,
          dateOfBirth: _dateOfBirthController.text,
          phoneNumber: _phoneNumberController.text,
          email: _emailController.text,
          bankAcountNumber: _bankAcountNumberController.text);
      context.read<CustomerBloc>().add(UpdateCustomerEvent(
          customerData: customerData,
          oldCustomerData: oldCustomer,
          index: index,
          selectedCustomerIndex: index));
      updatedCustomer = CustomerEntity(
          firstName: _firstNameController.text,
          lastName: _lastNameController.text,
          dateOfBirth: _dateOfBirthController.text,
          phoneNumber: _phoneNumberController.text,
          email: _emailController.text,
          bankAcountNumber: _bankAcountNumberController.text);
    }
  }

  @override
  void didChangeDependencies() {
    Future.delayed(Duration(microseconds: 30), () {
      // context.read<CustomerBloc>().emit(CustomerState(
      //       customers: [],
      //     ));
      //isUpdating = context.read<CustomerBloc>().state.isUpdating;
      updatingCustomer = context.read<CustomerBloc>().state.updatingCustomer;
      if (isUpdating) {
        _firstNameController.text = updatingCustomer?.firstName ?? "";
        _lastNameController.text = updatingCustomer?.lastName ?? "";
        _dateOfBirthController.text = updatingCustomer?.dateOfBirth ?? "";
        _phoneNumberController.text = updatingCustomer?.phoneNumber ?? "";
        _emailController.text = updatingCustomer?.email ?? "";
        _bankAcountNumberController.text =
            updatingCustomer?.bankAcountNumber ?? "";
        context
            .read<CustomerBloc>()
            .add(IsUpdatingCustomer(isUpdatingCustomer: false));
      }
      setState(() {});
    });
    super.didChangeDependencies();
  }

  @override
  void initState() {
    Future.delayed(Duration(microseconds: 30), () {
      // context.read<CustomerBloc>().emit(CustomerState(
      //       customers: [],
      //     ));
      isUpdating = context.read<CustomerBloc>().state.isUpdating;
      updatingCustomer = context.read<CustomerBloc>().state.updatingCustomer;
      if (isUpdating) {
        _firstNameController.text = updatingCustomer?.firstName ?? "";
        _lastNameController.text = updatingCustomer?.lastName ?? "";
        _dateOfBirthController.text = updatingCustomer?.dateOfBirth ?? "";
        _phoneNumberController.text = updatingCustomer?.phoneNumber ?? "";
        _emailController.text = updatingCustomer?.email ?? "";
        _bankAcountNumberController.text =
            updatingCustomer?.bankAcountNumber ?? "";
      }
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    print("dispose");
    Future.delayed(Duration(microseconds: 30), () {
      if (mounted) {
        context
            .read<CustomerBloc>()
            .add(IsUpdatingCustomer(isUpdatingCustomer: false));
        context.read<CustomerBloc>().add(UpdatingCustomer(
            updatingCustomer: CustomerEntity(
                firstName: "",
                lastName: "",
                dateOfBirth: "",
                phoneNumber: "",
                email: "",
                bankAcountNumber: "")));
        context.read<CustomerBloc>().add(GetCustomers());
      }
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: BlocBuilder<CustomerBloc, CustomerState>(builder: (context, state) {
        if (state.status == CustomerStatus.added) {
          context.read<CustomerBloc>().add(GetCustomers());
          Navigator.of(context).pop();
        } else if (state.status == CustomerStatus.updated) {
          Future.delayed(Duration(microseconds: 30), () {
            context.read<CustomerBloc>().add(GetCustomers());
            context
                .read<CustomerBloc>()
                .add(UpdatingCustomer(updatingCustomer: updatedCustomer));
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.purple,
              content: Text('Customer updated'),
            ));
            Navigator.of(context).pop();
          });
        }
        switch (state.status) {
          case CustomerStatus.initial:
            return _mainWidget(state.status);
          case CustomerStatus.loading:
            return Center(
              child: CircularProgressIndicator(),
            );
          case CustomerStatus.added:
            return _mainWidget(state.status);
          case CustomerStatus.updated:
            return _mainWidget(state.status);
          case CustomerStatus.error:
            Future.delayed(Duration(microseconds: 500), () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.purple,
                content:
                    Text('Customer exists and/or error in adding/updating'),
              ));
              context.read<CustomerBloc>().emit(
                    state.copyWith(status: CustomerStatus.initial),
                  );
            });

            return _mainWidget(state.status);
          default:
            return _mainWidget(state.status);
        }
      }),
    );
  }

  Widget _mainWidget(CustomerStatus status) {
    return Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: _firstNameController,
                  decoration: InputDecoration(
                    labelText: "First Name",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter first name';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextFormField(
                  controller: _lastNameController,
                  decoration: InputDecoration(
                      labelText: "Last Name", border: OutlineInputBorder()),
                  validator: ((value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter last name";
                    }
                    return null;
                  }),
                ),
                SizedBox(
                  height: 8.0,
                ),
                InkWell(
                  onTap: () async {
                    await _selectDate(context);
                  },
                  child: TextFormField(
                    controller: _dateOfBirthController,
                    readOnly: true,
                    decoration: InputDecoration(
                      enabled: false,
                      labelText: "Date Of Birth",
                      border: OutlineInputBorder(),
                      disabledBorder: OutlineInputBorder(),
                    ),
                    validator: ((value) {
                      if (value == null || value.isEmpty) {
                        return "Please select date of birth";
                      }
                      return null;
                    }),
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextFormField(
                  controller: _phoneNumberController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      labelText: "Phone Number", border: OutlineInputBorder()),
                  validator: ((value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter phone number";
                    }
                    return null;
                  }),
                  inputFormatters: [
                    LibPhonenumberTextFormatter(
                      phoneNumberType: _globalPhoneType,
                      phoneNumberFormat: _globalPhoneFormat,
                      country: _currentSelectedCountry,
                      inputContainsCountryCode: _inputContainsCountryCode,
                      shouldKeepCursorAtEndOfInput:
                          _shouldKeepCursorAtEndOfInput,
                    ),
                  ],
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelText: "Email Address", border: OutlineInputBorder()),
                  validator: ((value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter email address";
                    }
                    if (!value.contains("@") || !value.contains(".")) {
                      return "Please enter valid email address";
                    }
                    return null;
                  }),
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextFormField(
                  controller: _bankAcountNumberController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Bank Acount Number",
                      border: OutlineInputBorder()),
                  validator: ((value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter bank acount number";
                    }
                    return null;
                  }),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Container(
                    height: 60.0,
                    child: CustomerButtonWidget(
                            onPressed: () async {
                              bool error = false;
                              FocusScope.of(context).requestFocus(FocusNode());
                              Future.delayed(Duration(microseconds: 30),
                                  () async {
                                try {
                                  await parse(
                                    _phoneNumberController.text,
                                    region: _currentSelectedCountry.countryCode,
                                  );
                                  error = false;
                                } catch (e) {
                                  error = true;
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    backgroundColor: Colors.purple,
                                    content:
                                        Text('Please enter valid phone number'),
                                  ));
                                }
                              });
                              if (error == false) {
                                if (_dateOfBirthController.text.isEmpty) {
                                  error = true;
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    backgroundColor: Colors.purple,
                                    content:
                                        Text('Please select date of birth'),
                                  ));
                                } else {
                                  error = false;
                                }
                              }
                              if (!error) {
                                if (_formKey.currentState?.validate() ??
                                    false) {
                                  await submitCustomer();
                                }
                              }
                            },
                            text: isUpdating ? "UPDATE" : "ADD")
                        .button()),
              ],
            ),
          ),
        ));
  }
}

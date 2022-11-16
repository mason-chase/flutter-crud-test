import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mc_crud_test/features/add_customer/presentation/bloc/add_customer_bloc.dart';
import 'package:mc_crud_test/features/get_customers/presentation/screens/customers.dart';

import '../../../../core/data/data_source/local/customer_entity.dart';

class AddCustomerScreen extends StatefulWidget {
  const AddCustomerScreen({Key? key}) : super(key: key);

  @override
  State<AddCustomerScreen> createState() => _AddCustomerScreenState();
}

class _AddCustomerScreenState extends State<AddCustomerScreen> {

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController bankAccountController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(children: [
            TextField(
              controller: firstNameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'First Name',
                hintText: 'Enter Your Name',
              ),
            ),
            TextField(
              controller: lastNameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'First Name',
                hintText: 'Enter Your Name',
              ),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'First Name',
                hintText: 'Enter Your Name',
              ),
            ),
            TextField(
              controller: phoneNumberController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'First Name',
                hintText: 'Enter Your Name',
              ),
            ),
            RaisedButton(
              textColor: Colors.white,
              color: Colors.blue,
              child: Text('Save'),
              onPressed: () {
                BlocProvider.of<AddCustomerBloc>(context).add(
                    NewCustomerEvent(setCustomerInfo()));
                Navigator.pop(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AllCustomers(),
                  ),
                );
              },
            ),
          ]),
        ),
      ),
    );
  }


  CustomerEntity setCustomerInfo() {
    return CustomerEntity(firstName: firstNameController.text,
    lastName: lastNameController.text,
    phoneNumber: phoneNumberController.text,
    email: emailController.text,
    dateOfBirth: 555555,
    bankAccountNumber: bankAccountController.text,);
  }

}

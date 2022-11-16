import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mc_crud_test/features/add_customer/presentation/bloc/add_customer_bloc.dart';
import 'package:mc_crud_test/features/get_customers/presentation/screens/customers.dart';
import 'package:mc_crud_test/features/update_customer/presentation/bloc/update_customer_bloc.dart';

import '../../../../core/data/data_source/local/customer_entity.dart';

class UpdateCustomerScreen extends StatefulWidget {
  CustomerEntity customerEntity;
  UpdateCustomerScreen({required this.customerEntity, Key? key}) : super(key: key);

  @override
  State<UpdateCustomerScreen> createState() => _UpdateCustomerScreenState();
}

class _UpdateCustomerScreenState extends State<UpdateCustomerScreen> {

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController bankAccountController = TextEditingController();

  @override
  void initState() {
    super.initState();
   setData();
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
                BlocProvider.of<UpdateCustomerBloc>(context).add(
                    UpdateCustomerEvent(setCustomerInfo()));

                // Navigator.pop(context);

                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => AllCustomers()));
                // ).then((value){setState(() {});});
                // Navigator.pop(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => AllCustomers(),
                //   ),
                // );
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

  setData(){
    firstNameController.text = widget.customerEntity.firstName!;
    lastNameController.text = widget.customerEntity.lastName!;
    emailController.text = widget.customerEntity.email!;
    bankAccountController.text = widget.customerEntity.bankAccountNumber!;
    phoneNumberController.text = widget.customerEntity.phoneNumber!;
  }

}

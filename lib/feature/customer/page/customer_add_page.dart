import 'package:flutter/material.dart';
import 'package:mc_crud_test/feature/customer/widget/customer_button_widget.dart';

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: _firstNameController,
                decoration: InputDecoration(
                    labelText: "First Name", border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                controller: _lastNameController,
                decoration: InputDecoration(
                    labelText: "Last Name", border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 8.0,
              ),
              InkWell(
                onTap: () async {
                  await _selectDate(context);
                },
                child: TextField(
                  controller: _dateOfBirthController,
                  readOnly: true,
                  decoration: InputDecoration(
                    enabled: false,
                    labelText: "Date Of Birth",
                    border: OutlineInputBorder(),
                    disabledBorder: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                controller: _phoneNumberController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                    labelText: "Phone Number", border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    labelText: "Email Address", border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                controller: _bankAcountNumberController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Bank Acount Number",
                    border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 8.0,
              ),
              Container(
                  height: 60.0,
                  child: CustomerButtonWidget(onPressed: () {}, text: "ADD")
                      .button()),
            ],
          ),
        ),
      ),
    );
  }
}

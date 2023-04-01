import 'package:flutter/material.dart';
import 'package:mc_crud_test/core/customer/data/dto/customer_dto.dart';
import 'package:mc_crud_test/feature/customer/widget/customer_button_widget.dart';

class CustomerDetailPage extends StatelessWidget {
  CustomerDetailPage({Key? key, this.customerData}) : super(key: key);
  CustomerDTO? customerData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Customer Detail"),
        backgroundColor: Colors.purple,
        leading: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: Icon(Icons.arrow_back_ios)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            _labelWidget(
              text: "First Name",
            ),
            SizedBox(
              height: 8.0,
            ),
            _infoWidget(
              text: "First",
            ),
            _labelWidget(
              text: "Last Name",
            ),
            SizedBox(
              height: 8.0,
            ),
            _infoWidget(
              text: "Last",
            ),
            _labelWidget(
              text: "Date Of Birth",
            ),
            SizedBox(
              height: 8.0,
            ),
            _infoWidget(
              text: "DOB",
            ),
            _labelWidget(
              text: "Phone Number",
            ),
            SizedBox(
              height: 8.0,
            ),
            _infoWidget(
              text: "1111",
            ),
            _labelWidget(
              text: "Email Address",
            ),
            SizedBox(
              height: 8.0,
            ),
            _infoWidget(
              text: "Email",
            ),
            _labelWidget(
              text: "Bank Acount Number",
            ),
            SizedBox(
              height: 8.0,
            ),
            _infoWidget(
              text: "11122300",
            ),
            SizedBox(
              height: 16.0,
            ),
            Container(
                height: 60.0,
                child: CustomerButtonWidget(onPressed: () {}, text: "UPDATE")
                    .button()),
            SizedBox(
              height: 12.0,
            ),
            Container(
                height: 60.0,
                child: CustomerButtonWidget(onPressed: () {}, text: "DELETE")
                    .button()),
          ]),
        ),
      ),
    );
  }
}

class _infoWidget extends StatelessWidget {
  _infoWidget({
    Key? key,
    required this.text,
  }) : super(key: key);
  String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 16.0,
      ),
    );
  }
}

class _labelWidget extends StatelessWidget {
  _labelWidget({
    Key? key,
    required this.text,
  }) : super(key: key);
  String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20.0,
      ),
    );
  }
}

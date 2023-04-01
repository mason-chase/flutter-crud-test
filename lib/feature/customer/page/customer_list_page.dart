import 'package:flutter/material.dart';
import 'package:mc_crud_test/feature/customer/widget/customer_button_widget.dart';

class CustomerListPage extends StatelessWidget {
  const CustomerListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("Customers crud app"),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "List customers",
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 12.0,
              ),
              Container(
                height: 60.0,
                width: double.maxFinite,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CustomerButtonWidget(onPressed: () {}, text: "Add")
                        .button(),
                    CustomerButtonWidget(onPressed: () {}, text: "Delete")
                        .button(),
                  ],
                ),
              )
            ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.refresh),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class EmptyCustomerList extends StatelessWidget {
  const EmptyCustomerList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: const Center(child: Text("No customers found.")));
  }
}

import 'package:flutter/material.dart';

class CustomerListEmptyWidget extends StatelessWidget {
  const CustomerListEmptyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("No data"),
    );
  }
}

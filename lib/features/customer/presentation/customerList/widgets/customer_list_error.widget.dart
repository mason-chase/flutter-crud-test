import 'package:flutter/material.dart';

class CustomerListErrorWidget extends StatelessWidget {
  const CustomerListErrorWidget(String message, {Key? key}) : super(key: key);
  final String message = "Error";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(message),
    );
  }
}

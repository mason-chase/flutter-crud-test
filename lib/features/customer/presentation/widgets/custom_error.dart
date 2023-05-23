import 'package:flutter/material.dart';

class CustomError extends StatelessWidget {
  final String message;

  const CustomError({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(message),
    );
  }
}

import 'package:flutter/material.dart';

class CustomerButtonWidget {
  CustomerButtonWidget({required this.onPressed, required this.text});
  void Function() onPressed;
  String text;

  Widget button() {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.purple,
          elevation: 8.0,
        ),
        child: Text(text));
  }
}

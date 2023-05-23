import 'package:flutter/material.dart';

class CustomerInfoWidget {
  CustomerInfoWidget({required this.firstText, required this.infoText});
  String firstText;
  String infoText;

  Widget info() {
    return Row(
      children: [
        Text(
          firstText,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        SizedBox(
          width: 8.0,
        ),
        Text(
          infoText,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16.0,
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class ErrorLoadingData extends StatelessWidget {
  const ErrorLoadingData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: const Center(child: Text("An error occured.")));
  }
}

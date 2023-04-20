import 'package:flutter/material.dart';

class CustomerListLoadingWidget extends StatelessWidget {
  const CustomerListLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: const [CircularProgressIndicator(), Text("Loading...")],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CustomerListLoadingWidget extends StatelessWidget {
  const CustomerListLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:  [const SizedBox(width:50,height:50,child: CircularProgressIndicator()),
          const SizedBox(height: 16),
          Text("Loading...",style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: Colors.black,
          ))],
      ),
    );
  }
}

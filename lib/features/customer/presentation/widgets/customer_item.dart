import 'package:flutter/material.dart';
import 'package:mc_crud_test/features/customer/domain/entities/customer.dart';

class CustomerItem extends StatelessWidget {
  final Customer model;

  const CustomerItem({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _item("Email: ", model.email),
          _item("First name: ", model.firstname),
          _item("Last name: ", model.lastname),
          _item("Phone number: ", model.phoneNumber),
          _item("Birthday: ", model.dateOfBirth),
          _item("Bank number: ", model.bankAccountNumber),
        ],
      ),
    );
  }
}

Widget _item(String title, String subTitle) {
  return Text.rich(
    TextSpan(
      text: title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.blueAccent,
      ),
      children: [
        TextSpan(
          text: subTitle,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey.shade700,
          ),
        ),
      ],
    ),
  );
}

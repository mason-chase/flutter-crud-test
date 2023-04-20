import 'package:flutter/material.dart';
import 'package:mc_crud_test/features/customer/domain/customer.entity.dart';

class CustomerListItem extends StatelessWidget {
  const CustomerListItem({Key? key, required this.customer}) : super(key: key);
  final Customer customer;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.grey.withOpacity(.1),
      ),
      child: Stack(
        children: [
          Row(
            children: [
              Container(
                height: 100.0,
                width: 100.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.grey.withOpacity(.1),
                ),
              ),
              const SizedBox(width: 8.0),
              Column(
                children: [
                  Text("${customer.firstname} ${customer.lastname}"),
                  Text(customer.email),
                  Text(customer.dateOfBirth),
                  Text(customer.bankAccountNumber)
                ],
              ),
              const Spacer(),
              Column(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.edit),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.delete),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

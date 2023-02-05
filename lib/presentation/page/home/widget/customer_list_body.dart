import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mc_crud_test/domain/customer/entity/customer_entity.dart';
import 'package:mc_crud_test/presentation/page/home/widget/customer_list_item.dart';
import 'package:mc_crud_test/presentation/theme/icony.dart';
import 'package:mc_crud_test/presentation/widget/show_status.dart';

class CustomerListBody extends StatelessWidget {
  final List<CustomerEntity> customers;

  const CustomerListBody({Key? key, required this.customers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return customers.isNotEmpty
        ? ListView.builder(
            padding: EdgeInsets.only(bottom: 90.h),
            physics: const BouncingScrollPhysics(),
            itemCount: customers.length,
            itemBuilder: (context, index) {
              final customer = customers[index];
              return CustomerListItem(customer: customer);
            },
          )
        : const ShowStatus(
            icon: Icony.customers,
            iconSize: 30,
            title: "The customer list is empty",
            description: 'You can add a customer to your list using the button below',
          );
  }
}

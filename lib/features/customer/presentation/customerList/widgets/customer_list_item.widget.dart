import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mc_crud_test/features/customer/domain/customer.entity.dart';
import 'package:mc_crud_test/features/customer/presentation/customerList/bloc/customer_list.bloc.dart';
import 'package:mc_crud_test/features/customer/presentation/customerList/bloc/customer_list.event.dart';

class CustomerListItem extends StatelessWidget {
  const CustomerListItem(
      {Key? key, required this.customer, required this.index})
      : super(key: key);
  final Customer customer;
  final int index;

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
                    key: Key("edit-$index"),
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      "assets/image/icon/edit.svg",
                      height: 20.0,
                      width: 20.0,
                    ),
                  ),
                  IconButton(
                      key: Key("delete-$index"),
                      onPressed: () {
                        context.read<CustomerListBloc>().add(
                              DeleteCustomer(customer),
                            );
                      },
                      icon: SvgPicture.asset(
                        "assets/image/icon/trash.svg",
                        height: 20.0,
                        width: 20.0,
                      )),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mc_crud_test/app/app_routes.dart';
import 'package:mc_crud_test/features/customer/domain/customer.entity.dart';
import 'package:mc_crud_test/features/customer/presentation/customerList/bloc/customer_list.bloc.dart';
import 'package:mc_crud_test/features/customer/presentation/customerList/bloc/customer_list.event.dart';
import 'package:mc_crud_test/features/customer/presentation/theme/app.color.dart';
import 'package:mc_crud_test/features/customer/presentation/theme/app_icons.dart';
import 'package:mc_crud_test/features/customer/presentation/widgets/icon_text.widget.dart';

class CustomerListItem extends StatelessWidget {
  const CustomerListItem(
      {Key? key, required this.customer, required this.index})
      : super(key: key);
  final Customer customer;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              children: [
                IconText(
                  text: "${customer.firstname} ${customer.lastname}",
                  icon: AppIcons.profile,
                ),
                IconText(
                  text: customer.phoneNumber,
                  icon: AppIcons.mobile,
                ),
                IconText(
                  text: customer.email,
                  icon: AppIcons.email,
                ),
                IconText(
                  text: customer.dateOfBirth,
                  icon: AppIcons.calendar,
                ),
                IconText(
                  text: customer.bankAccountNumber,
                  icon: AppIcons.card,
                ),


              ],

            ),
          ),
          Column(
            children: [
              IconButton(
                key: Key("update-$index"),
                onPressed: () {
                  // navigate to edit page
                  Navigator.pushNamed(
                    context,
                    AppRoutes.updateCustomer,
                    arguments: customer,
                  );
                },
                icon: const Icon(Icons.edit,color: Colors.green,),
              ),
              IconButton(
                  key: Key("delete-$index"),
                  onPressed: () {
                    context.read<CustomerListBloc>().add(
                      DeleteCustomer(customer),
                    );
                  },
                  icon:  Icon(Icons.delete,color:AppColors.warningColor.shade400 ,)),
            ],
          )
        ],
      ),
    );
  }
}

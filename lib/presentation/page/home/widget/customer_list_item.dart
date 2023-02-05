import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hero_button/hero_button.dart';
import 'package:mc_crud_test/application/core/core_state.dart';
import 'package:mc_crud_test/application/customer/delete_customer/delete_customer_cubit.dart';
import 'package:mc_crud_test/application/customer/get_all_customer/get_all_customer_cubit.dart';
import 'package:mc_crud_test/domain/customer/entity/customer_entity.dart';
import 'package:mc_crud_test/presentation/routing/routing.dart';
import 'package:mc_crud_test/presentation/theme/colory.dart';
import 'package:mc_crud_test/presentation/theme/icony.dart';
import 'package:mc_crud_test/presentation/theme/theme_config.dart';
import 'package:mc_crud_test/presentation/widget/dialog/action_dialog.dart';
import 'package:mc_crud_test/presentation/widget/dialog/show_dialog.dart';
import 'package:mc_crud_test/presentation/widget/icon_text_data.dart';

class CustomerListItem extends StatelessWidget {
  final CustomerEntity customer;

  const CustomerListItem({Key? key, required this.customer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<DeleteCustomerCubit, CoreState<Unit>>(
      listener: (context, state) {
        state.maybeMap(
          orElse: () {},
          fetchDataSuccessfully: (_) => context.read<GetAllCustomerCubit>().getAllCustomer(),
        );
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: ThemeConfig.appHorizontalPadding.w,
          vertical: 6.h,
        ),
        child: Dismissible(
          key: Key(customer.id!.toString()),
          direction: DismissDirection.startToEnd,
          confirmDismiss: (directin) async {
            final res = showDeleteCustomerDialog(context);
            if (res != null && res) return true;
            return false;
          },
          background: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: SvgPicture.asset(Icony.trash, color: Colors.red, height: 50.h),
            ),
          ),
          child: HeroButton(
            onPressed: () => context.push(Routing.addCustomerPage, extra: customer),
            height: double.infinity,
            buttonColor: Colors.white,
            padding: EdgeInsets.all(20.r),
            borderColor: Colory.neutralColor.shade200,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: IconTextData(
                        text: "${customer.firstName} ${customer.lastName}",
                        icon: Icony.profile,
                      ),
                    ),
                    Expanded(
                      child: IconTextData(
                        text: customer.phoneNumber,
                        icon: Icony.mobile,
                      ),
                    ),
                  ],
                ),
                IconTextData(
                  text: customer.email,
                  icon: Icony.email,
                ),
                IconTextData(
                  text: customer.bankAccountNumber,
                  icon: Icony.card,
                ),
                Row(
                  children: [
                    Expanded(
                      child: IconTextData(
                        text: customer.dateOfBirth,
                        icon: Icony.calendar,
                      ),
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {},
                          child: SvgPicture.asset(
                            Icony.edit,
                            color: Colory.neutralColor.shade400,
                          ),
                        ),
                        const SizedBox(width: 20),
                        InkWell(
                          onTap: () => showDeleteCustomerDialog(context),
                          child: SvgPicture.asset(
                            Icony.trash,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  showDeleteCustomerDialog(BuildContext context) async => await showSimpleDialog<bool>(
        context: context,
        dialog: ActionDialog(
          onAction: () => context.read<DeleteCustomerCubit>().deleteCustomer(customer),
          actionTitle: 'Delete',
          header: 'Delete Customer',
          title: 'Do you want to delete the customer named ${customer.firstName}?',
        ),
      );
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hero_button/hero_button.dart';
import 'package:mc_crud_test/domain/customer/entity/customer_entity.dart';
import 'package:mc_crud_test/presentation/theme/colory.dart';
import 'package:mc_crud_test/presentation/theme/icony.dart';
import 'package:mc_crud_test/presentation/widget/icon_text_data.dart';
import 'package:mc_crud_test/presentation/widget/show_status.dart';

class CustomerListBody extends StatelessWidget {
  final List<CustomerEntity> customers;

  const CustomerListBody({Key? key, required this.customers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return customers.isNotEmpty
        ? ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: customers.length,
            itemBuilder: (context, index) {
              final customer = customers[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Dismissible(
                  key: Key(customer.id!.toString()),
                  direction: DismissDirection.startToEnd,
                  confirmDismiss: (directin) async{
                    print('111111111111111111');
                    return true;
                  },
                  onDismissed: (directin){
                    print('3333333333333333333');
                  },
                  background: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: SvgPicture.asset(Icony.trash, color: Colors.red, height: 50.h),
                    ),
                  ),
                  child: HeroButton(
                    onPressed: () {},
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
                                  onTap: () {},
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
              );
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

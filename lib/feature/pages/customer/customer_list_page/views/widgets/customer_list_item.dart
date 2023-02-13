import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../domain/entities/customer_entity.dart';
import '../../../../../../shared_library/infrastructure/styles/test_app_theme_data.dart';
import '../../../../../../shared_library/infrastructure/utils/utils.dart';

class CustomerListItem extends StatelessWidget {
  final CustomerEntity item;
  final void Function() onOptionsTap;

  const CustomerListItem(
      {required this.onOptionsTap, required this.item, final Key? key})
      : super(key: key);

  @override
  Widget build(final BuildContext context) => Padding(
        padding: Utils.smallPadding,
        child: Container(
          padding: Utils.smallPadding,
          decoration: BoxDecoration(
            color: TestAppThemeData.cardColor,
            borderRadius: BorderRadius.circular(Utils.normalRadius),
          ),
          child: Row(
            children: [
              const ClipOval(
                child: Icon(Icons.person),
              ),
              Utils.smallHorizontalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _fulName(),
                  Utils.smallVerticalSpace,
                  _email(),
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _date(),
                  Utils.smallVerticalSpace,
                  _mobile(),
                  Utils.smallVerticalSpace,
                  _accountNumber(),
                ],
              ),
              _options(),
            ],
          ),
        ),
      );

  Widget _options() => IconButton(
        onPressed: () {},
        icon: const Icon(Icons.more_vert_sharp, size: Utils.mediumSize),
      );

  Widget _fulName() => Text(
        '${item.firstName} ${item.lastName}',
        style: Get.textTheme.bodyText2,
      );

  Widget _email() => Text(
        item.email,
        style: Get.textTheme.caption,
      );

  Widget _mobile() => Row(
        children: [
          const Icon(Icons.phone, size: Utils.smallSize),
          Utils.smallHorizontalSpace,
          Text(
            item.phoneNumber,
            style: Get.textTheme.caption,
          ),
        ],
      );

  Widget _accountNumber() => Row(
        children: [
          const Icon(Icons.account_balance_wallet, size: Utils.smallSize),
          Utils.smallHorizontalSpace,
          Text(
            item.bankAccountNumber,
            style: Get.textTheme.caption,
          ),
        ],
      );

  Widget _date() => Row(
        children: [
          const Icon(Icons.calendar_today_rounded, size: Utils.smallSize),
          Utils.smallHorizontalSpace,
          Text(
            Utils.displayDateFromUtc(item.dateOfBirth),
            style: Get.textTheme.caption,
          ),
        ],
      );
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../shared_library/infrastructure/routes/route_paths.dart';
import '../../../../../shared_library/infrastructure/utils/utils.dart';
import '../../../../../shared_library/views/custom_app_bar.dart';
import '../../../../../shared_library/views/max_body_widget.dart';

class CustomerListPage extends StatelessWidget {
  const CustomerListPage({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) => Scaffold(
        appBar: const CustomAppBar(),
        floatingActionButton: _buildFloatingActionButton(),
        body: MaxWidthWidget(
          child: Center(
            child: Text(
              'customer-list',
              style: Get.textTheme.caption,
            ),
          ),
        ),
      );

  Widget _buildFloatingActionButton() => FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          final result = await Get.toNamed(RoutePaths.addCustomerPage);
          if (result != null) {
            Utils.successToast(message: 'Successfully added');
          }
        },
      );
}

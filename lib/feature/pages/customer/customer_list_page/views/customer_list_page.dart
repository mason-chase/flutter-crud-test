import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../domain/entities/customer_entity.dart';
import '../../../../../shared_library/infrastructure/routes/route_paths.dart';
import '../../../../../shared_library/infrastructure/utils/utils.dart';
import '../../../../../shared_library/views/advance_list_view.dart';
import '../../../../../shared_library/views/custom_app_bar.dart';
import '../../../../../shared_library/views/max_body_widget.dart';
import '../controllers/customer_list_controller.dart';
import 'widgets/customer_list_item.dart';

class CustomerListPage extends GetView<CustomerListController> {
  const CustomerListPage({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) => Scaffold(
        appBar: const CustomAppBar(),
        floatingActionButton: _buildFloatingActionButton(),
        body: MaxWidthWidget(
          maxWidth: Utils.mediumWith,
          child: Obx(_customerList),
        ),
      );

  Widget _customerList() => AdvanceListView<CustomerEntity>(
        itemBuilder: (final _, final item, final __) => CustomerListItem(
          onOptionsTap: () {},
          item: item,
        ),
        onRefreshData: controller.refreshCustomers,
        items: controller.paginationList.list,
        key: controller.paginationList.key,
        hasMoreData: controller.paginationList.hasMoreData.value,
      );

  Widget _buildFloatingActionButton() => FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          final result = await Get.toNamed(RoutePaths.addCustomerPage);
          if (result != null) {
            Utils.successToast(message: 'Successfully added');
            controller.paginationList.key.currentState!.addItem(result);
          }
        },
      );
}

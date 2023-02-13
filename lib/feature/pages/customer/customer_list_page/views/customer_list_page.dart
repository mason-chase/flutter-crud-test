import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../domain/entities/customer_entity.dart';
import '../../../../../shared_library/infrastructure/routes/route_paths.dart';
import '../../../../../shared_library/infrastructure/utils/utils.dart';
import '../../../../../shared_library/views/advance_list_view.dart';
import '../../../../../shared_library/views/custom_app_bar.dart';
import '../../../../../shared_library/views/double_child_widget.dart';
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
        itemBuilder: (final _, final item, final index) => CustomerListItem(
          onOptionsTap: () => _showOptionsDialog(item, index),
          item: item,
        ),
        onRefreshData: controller.refreshCustomers,
        items: controller.paginationList.list,
        key: controller.paginationList.key,
        hasMoreData: controller.paginationList.hasMoreData.value,
      );

  Future<void> _showOptionsDialog(
      final CustomerEntity item, final int index) async {
    await Get.dialog(
      SimpleDialog(
        children: [
          _editButton(item, index),
          _deleteButton(
            name: '${item.firstName} ${item.lastName}',
            index: index,
            id: item.id,
          ),
        ],
      ),
    );
  }

  Widget _deleteButton(
          {required final String name,
          required final String id,
          required final int index}) =>
      TextButton(
        onPressed: () => _showDeleteDialog(name: name, index: index, id: id),
        child: const Text('Delete Customer'),
      );

  Future<void> _showDeleteDialog(
      {required final String name,
      required final String id,
      required final int index}) async {
    Get.back();
    await Get.dialog(
      SimpleDialog(
        children: [
          Center(child: Text('Are you sure to delete $name ?')),
          Utils.largeVerticalSpace,
          DoubleChildWidget(
            first: TextButton(
              onPressed: () {
                controller.deleteCustomer(
                  id: id,
                  index: index,
                );
                controller.paginationList.key.currentState!.removeItemAt(index);
              },
              child: const Text('Yes'),
            ),
            second: TextButton(
              onPressed: Get.back,
              child: const Text('No'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _editButton(final CustomerEntity item, final int index) => TextButton(
        onPressed: () async {
          Get.back();
          final result = await Get.toNamed(
            RoutePaths.editCustomerPage,
            parameters: {
              'id': item.id,
            },
          );
          if (result != null) {
            Utils.successToast(message: 'Successfully edited');
            controller.paginationList.key.currentState![index] = result;
          }
        },
        child: const Text('Edit Customer'),
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

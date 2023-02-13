import 'package:get/get.dart';

import '../../../../../domain/entities/customer_entity.dart';
import '../../../../../domain/use_cases/customer/delete_customer_use_case.dart';
import '../../../../../domain/use_cases/customer/get_all_customers_use_case.dart';
import '../../../../../shared_library/infrastructure/utils/pagination_list.dart';
import '../../../../../shared_library/infrastructure/utils/utils.dart';

class CustomerListController extends GetxController {
  final GetAllCustomersUseCase _getAllUseCase = GetAllCustomersUseCase();
  final DeleteCustomerUseCase _deleteCustomerUseCase = DeleteCustomerUseCase();
  final PaginationListHandler<CustomerEntity> paginationList =
      PaginationListHandler();

  @override
  void onInit() {
    getAllCustomers();
    super.onInit();
  }

  Future<void> deleteCustomer({
    required final String id,
    required final int index,
  }) async {
    final exceptionOrResult = await _deleteCustomerUseCase.call(
      params: id,
    );
    exceptionOrResult.fold(
      (final exception) => Utils.errorToast(message: exception.toString()),
      (final result) {
        Get.back();
        Utils.successToast(message: 'Successfully Deleted');
        paginationList.key.currentState!.removeItemAt(index);
      },
    );
  }

  Future<void> getAllCustomers() async {
    paginationList.hasMoreData.value = true;
    final exceptionOrResult = await _getAllUseCase.call();
    exceptionOrResult.fold(
      (final failure) {
        paginationList.hasMoreData.value = false;
        paginationList.showError.value = true;
      },
      (final result) {
        paginationList.hasMoreData.value = false;
        paginationList.key.currentState!.addAll(result);
      },
    );
  }

  Future<void> refreshCustomers() async {
    resetCustomerList();
    await getAllCustomers();
  }

  void resetCustomerList() {
    if (paginationList.key.currentState != null) {
      paginationList.key.currentState!.clearAllItems();
    } else if (paginationList.list.isNotEmpty) {
      paginationList.list.clear();
    }
    paginationList.paginationOffset = 0;
  }
}

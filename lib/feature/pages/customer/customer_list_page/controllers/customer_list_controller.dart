import 'package:get/get.dart';

import '../../../../../domain/entities/customer_entity.dart';
import '../../../../../domain/use_cases/customer/get_all_customers_use_case.dart';
import '../../../../../shared_library/infrastructure/utils/pagination_list.dart';

class CustomerListController extends GetxController {
  final GetAllCustomersUseCase _useCase = GetAllCustomersUseCase();
  final PaginationListHandler<CustomerEntity> paginationList =
      PaginationListHandler();

  @override
  void onInit() {
    getAllCustomers();
    super.onInit();
  }

  Future<void> getAllCustomers() async {
    paginationList.hasMoreData.value = true;
    final exceptionOrResult = await _useCase.call();
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

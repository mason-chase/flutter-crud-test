import 'package:get/get.dart';

import '../../../feature/pages/customer/customer_list_page/views/customer_list_page.dart';
import '../../../feature/pages/customer/modify_customer_page/bindings/add_customer_bindings.dart';
import '../../../feature/pages/customer/modify_customer_page/controllers/add_customer_controller.dart';
import '../../../feature/pages/customer/modify_customer_page/views/modify_customer_page.dart';
import '../../../feature/pages/not_found_page/views/not_found_page.dart';
import 'route_paths.dart';

class TestAppPages {
  static final pages = [
    GetPage(
      name: RoutePaths.customerListPage,
      page: CustomerListPage.new,
      children: [
        GetPage(
          binding: AddCustomerBindings(),
          name: '${RoutePaths.customerListPage}${RoutePaths.addCustomerPage}',
          page: ModifyCustomerPage<AddCustomerController>.new,
        ),
      ],
    ),
    GetPage(
      name: RoutePaths.notFoundPage,
      page: NotFoundPage.new,
    ),
  ];
}

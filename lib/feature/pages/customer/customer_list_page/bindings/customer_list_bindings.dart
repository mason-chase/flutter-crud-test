import 'package:get/get.dart';

import '../controllers/customer_list_controller.dart';

class CustomerListBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(CustomerListController.new);
  }
}

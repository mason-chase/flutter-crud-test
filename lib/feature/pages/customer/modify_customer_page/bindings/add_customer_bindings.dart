import 'package:get/get.dart';

import '../controllers/add_customer_controller.dart';

class AddCustomerBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(AddCustomerController.new);
  }
}

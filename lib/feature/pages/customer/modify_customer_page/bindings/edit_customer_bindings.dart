import 'package:get/get.dart';

import '../controllers/edit_customer_controller.dart';

class EditCustomerBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(EditCustomerController.new);
  }
}

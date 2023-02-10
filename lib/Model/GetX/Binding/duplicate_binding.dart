import 'package:amir_crud_test/Model/GetX/Controller/duplicate_controller.dart';
import 'package:get/get.dart';

class DuplicateBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DuplicateController());
  }
}

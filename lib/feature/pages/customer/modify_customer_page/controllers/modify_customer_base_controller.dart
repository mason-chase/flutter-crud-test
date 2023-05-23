import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../../shared_library/models/page_status_enum.dart';

abstract class ModifyCustomerBaseController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey();
  Rxn<DateTime> selectedDate = Rxn();
  final Rx<PageStatusEnum> state = PageStatusEnum.loading.obs;
  final RxBool isWaiting = false.obs;

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController mobileNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController accountNumberController = TextEditingController();

  Future<void> modifyCustomer();

  Future<void> getCustomerById();
}

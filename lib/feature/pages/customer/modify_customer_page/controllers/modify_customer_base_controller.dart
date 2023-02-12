import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class ModifyCustomerBaseController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey();
  DateTime? selectedDate;

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController mobileNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController accountNumberController = TextEditingController();

  Future<void> modifyCustomer();
}

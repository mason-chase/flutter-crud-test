import 'package:get/get.dart';

import '../../../../../data/dtos/customer/customer_dto.dart';
import '../../../../../domain/use_cases/customer/add_customer_use_case.dart';
import '../../../../../shared_library/infrastructure/utils/utils.dart';
import 'modify_customer_base_controller.dart';

class AddCustomerController extends ModifyCustomerBaseController {
  final AddCustomerUseCase _addCustomerUseCase = AddCustomerUseCase();

  @override
  Future<void> modifyCustomer() async {
    if (formKey.currentState!.validate()) {
      if (selectedDate != null) {
        final exceptionOrResult =
            await _addCustomerUseCase.call(params: _addDto());

        exceptionOrResult.fold(
          (final failure) => Utils.errorToast(message: failure.toString()),
          (final result) {
            Get.back(result: result);
          },
        );
      } else {
        Utils.errorToast(message: 'Please select date of birth');
      }
    }
  }

  CustomerDto _addDto() => CustomerDto(
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        dateOfBirth: selectedDate!.toUtc().toString(),
        phoneNumber: mobileNumberController.text,
        email: emailController.text,
        bankAccountNumber: accountNumberController.text,
      );
}

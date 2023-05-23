import 'package:get/get.dart';

import '../../../../../data/dtos/customer/customer_dto.dart';
import '../../../../../domain/entities/customer_entity.dart';
import '../../../../../domain/use_cases/customer/edit_customer_use_case.dart';
import '../../../../../domain/use_cases/customer/get_customer_by_id_use_case.dart';
import '../../../../../shared_library/infrastructure/utils/utils.dart';
import '../../../../../shared_library/models/page_status_enum.dart';
import 'modify_customer_base_controller.dart';

class EditCustomerController extends ModifyCustomerBaseController {
  final String id = Get.parameters['id']!;

  final GetCustomerByIdUseCase _getCustomerByIdUseCase =
      GetCustomerByIdUseCase();
  final EditCustomerUseCase _editCustomerUseCase = EditCustomerUseCase();

  @override
  final Rx<PageStatusEnum> state = PageStatusEnum.loading.obs;
  late final CustomerEntity customer;

  @override
  Future<void> modifyCustomer() async {
    if (formKey.currentState!.validate()) {
      if (selectedDate.value != null) {
        isWaiting.value = true;
        final exceptionOrResult = await _editCustomerUseCase.call(
          params: _editDto(),
        );
        isWaiting.value = false;

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

  CustomerDto _editDto() => CustomerDto(
        id: id,
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        dateOfBirth: selectedDate.value!.toUtc().toString(),
        phoneNumber: mobileNumberController.text,
        email: emailController.text,
        bankAccountNumber: accountNumberController.text,
      );

  @override
  Future<void> getCustomerById() async {
    state.value = PageStatusEnum.loading;
    final exceptionOrResult = await _getCustomerByIdUseCase.call(params: id);

    exceptionOrResult.fold(
      (final exception) => state.value = PageStatusEnum.retry,
      (final result) {
        customer = result;
        _initForm();
        state.value = PageStatusEnum.success;
      },
    );
  }

  void _initForm() {
    firstNameController.text = customer.firstName;
    lastNameController.text = customer.lastName;
    mobileNumberController.text = customer.phoneNumber;
    accountNumberController.text = customer.bankAccountNumber;
    emailController.text = customer.email;
    selectedDate.value = DateTime.parse(customer.dateOfBirth).toLocal();
  }

  @override
  void onInit() {
    getCustomerById();
    super.onInit();
  }
}

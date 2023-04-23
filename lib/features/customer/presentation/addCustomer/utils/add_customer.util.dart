import 'package:mc_crud_test/core/models/app_form_state.enum.dart';
import 'package:mc_crud_test/core/models/custom_field.dart';
import 'package:mc_crud_test/core/models/status.enum.dart';
import 'package:mc_crud_test/features/customer/domain/customer.entity.dart';
import 'package:mc_crud_test/features/customer/presentation/addCustomer/bloc/add_customer.state.dart';

class CustomerUtil{
 static AddCustomerState mapCustomerToAddCustomerState(Customer customer){
   return AddCustomerState(
     firstname: CustomFiled(
       value: customer.firstname,
       state: FieldState.valid,
       errorMessage: null,
     ),
      lastname: CustomFiled(
        value: customer.lastname,
        state: FieldState.valid,
        errorMessage: null,
      ),
      email: CustomFiled(
        value: customer.email,
        state: FieldState.valid,
        errorMessage: null,
      ),
      phone: CustomFiled(
        value: customer.phoneNumber,
        state: FieldState.valid,
        errorMessage: null,
      ),
      dateOfBirth: CustomFiled(
        value: customer.dateOfBirth,
        state: FieldState.valid,
        errorMessage: null,
      ),
      bankAccount: CustomFiled(
        value: customer.bankAccountNumber,
        state: FieldState.valid,
        errorMessage: null,
      ),
      formState: AppFormState.valid,
      status: Status.initial,
      errorMessage: null,
      customer: customer,
   );

 }
}
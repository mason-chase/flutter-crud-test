// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_import, directives_ordering

import 'package:mc_crud_test/features/customer/presentation/addCustomer/add_customer_form_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import './step/the_app_is_running.dart';
import './step/i_am_on_the_add_customer_screen.dart';
import './step/i_enter_valid_name_into_the_firstname_field.dart';
import './step/i_enter_valid_lastname_into_the_lastname_field.dart';
import './step/i_enter_invalid_number_into_the_phonenumber_field.dart';
import './step/i_should_see_text.dart';
import './step/i_enter_valid_number_into_the_phonenumber_field.dart';
import './step/i_enter_invalid_email_into_the_email_field.dart';
import './step/i_enter_valid_email_into_the_email_field.dart';
import './step/i_enter_invalid_bank_account_into_the_bank_account_field.dart';
import './step/i_enter_valid_bank_account_into_the_bank_account_field.dart';
import './step/i_enter_valid_date_of_birth_into_the_date_of_birth_field.dart';
import './step/i_tap_on_the_add_button.dart';
import './step/i_should_see_success_message.dart';
import './step/i_should_see_user_already_exist_message.dart';

void main() {
  group('''Add Customer''', () {
    testWidgets('''I am not able to add customer with invalid phone number''', (tester) async {
      await theAppIsRunning(tester);
      await iAmOnTheAddCustomerScreen(tester);
      await iEnterValidNameIntoTheFirstnameField(tester);
      await iEnterValidLastnameIntoTheLastnameField(tester);
      await iEnterInvalidNumberIntoThePhonenumberField(tester);
      await iShouldSeeText(tester, "Invalid phone");
    });
    testWidgets('''am not able to add customer with invalid email''', (tester) async {
      await theAppIsRunning(tester);
      await iAmOnTheAddCustomerScreen(tester);
      await iEnterValidNameIntoTheFirstnameField(tester);
      await iEnterValidLastnameIntoTheLastnameField(tester);
      await iEnterValidNumberIntoThePhonenumberField(tester);
      await iEnterInvalidEmailIntoTheEmailField(tester);
      await iShouldSeeText(tester, "Invalid email");
    });
    testWidgets('''I am not able to add customer with invalid bank account number''', (tester) async {
      await theAppIsRunning(tester);
      await iAmOnTheAddCustomerScreen(tester);
      await iEnterValidNameIntoTheFirstnameField(tester);
      await iEnterValidLastnameIntoTheLastnameField(tester);
      await iEnterValidNumberIntoThePhonenumberField(tester);
      await iEnterValidEmailIntoTheEmailField(tester);
      await iEnterInvalidBankAccountIntoTheBankAccountField(tester);
      await iShouldSeeText(tester, "Invalid bank account");
    });
    testWidgets('''I am able to add customer with valid data''', (tester) async {
      await theAppIsRunning(tester);
      await iAmOnTheAddCustomerScreen(tester);
      await iEnterValidNameIntoTheFirstnameField(tester);
      await iEnterValidLastnameIntoTheLastnameField(tester);
      await iEnterValidNumberIntoThePhonenumberField(tester);
      await iEnterValidEmailIntoTheEmailField(tester);
      await iEnterValidBankAccountIntoTheBankAccountField(tester);
      await iEnterValidDateOfBirthIntoTheDateOfBirthField(tester);
      await iTapOnTheAddButton(tester);
      await iShouldSeeSuccessMessage(tester);
    });
    testWidgets('''I am not able to add customer with not unique email''', (tester) async {
      await theAppIsRunning(tester);
      await iAmOnTheAddCustomerScreen(tester);
      await iEnterValidNameIntoTheFirstnameField(tester);
      await iEnterValidLastnameIntoTheLastnameField(tester);
      await iEnterValidNumberIntoThePhonenumberField(tester);
      await iEnterValidEmailIntoTheEmailField(tester);
      await iEnterValidBankAccountIntoTheBankAccountField(tester);
      await iEnterValidDateOfBirthIntoTheDateOfBirthField(tester);
      await iTapOnTheAddButton(tester);
      await iShouldSeeUserAlreadyExistMessage(tester);
    });
    testWidgets('''I am not able to add customer with not unique phone number''', (tester) async {
      await theAppIsRunning(tester);
      await iAmOnTheAddCustomerScreen(tester);
      await iEnterValidNameIntoTheFirstnameField(tester);
      await iEnterValidLastnameIntoTheLastnameField(tester);
      await iEnterValidNumberIntoThePhonenumberField(tester);
      await iEnterValidEmailIntoTheEmailField(tester);
      await iEnterValidBankAccountIntoTheBankAccountField(tester);
      await iEnterValidDateOfBirthIntoTheDateOfBirthField(tester);
      await iTapOnTheAddButton(tester);
      await iShouldSeeUserAlreadyExistMessage(tester);
    });
    testWidgets('''am not able to add customer because Customers must be unique in database: By `Firstname`, `Lastname` and `DateOfBirth`''', (tester) async {
      await theAppIsRunning(tester);
      await iAmOnTheAddCustomerScreen(tester);
      await iEnterValidNameIntoTheFirstnameField(tester);
      await iEnterValidLastnameIntoTheLastnameField(tester);
      await iEnterValidNumberIntoThePhonenumberField(tester);
      await iEnterValidEmailIntoTheEmailField(tester);
      await iEnterValidBankAccountIntoTheBankAccountField(tester);
      await iEnterValidDateOfBirthIntoTheDateOfBirthField(tester);
      await iTapOnTheAddButton(tester);
      await iShouldSeeUserAlreadyExistMessage(tester);
    });
  });
}

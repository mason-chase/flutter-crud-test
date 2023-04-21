// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_import, directives_ordering

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import './step/the_app_is_running.dart';
import './step/i_am_on_the_add_customer_screen.dart';
import './step/i_enter_into_the_field.dart';
import './step/i_enter_into_the_phone_number_field.dart';
import './step/i_should_see_invalid_phone_number_on_the_screen.dart';
import './step/i_should_see_invalid_email_on_the_screen.dart';
import './step/i_should_see_toast_on_the_screen.dart';
import './step/i_tap_on_the_add_button.dart';

void main() {
  group('''Add Customer''', () {
    testWidgets('''I am not able to add customer with invalid phone number''', (tester) async {
      await theAppIsRunning(tester);
      await iAmOnTheAddCustomerScreen(tester);
      await iEnterIntoTheField(tester, "Mohsen", "First Name");
      await iEnterIntoTheField(tester, "Balestani", "Last Name");
      await iEnterIntoThePhoneNumberField(tester, "1234567890");
      await iShouldSeeInvalidPhoneNumberOnTheScreen(tester);
    });
    testWidgets('''am not able to add customer with invalid email''', (tester) async {
      await theAppIsRunning(tester);
      await iAmOnTheAddCustomerScreen(tester);
      await iEnterIntoTheField(tester, "Mohsen", "First Name");
      await iEnterIntoTheField(tester, "Balestani", "Last Name");
      await iEnterIntoTheField(tester, "m.balestani", "Email");
      await iShouldSeeInvalidEmailOnTheScreen(tester);
    });
    testWidgets('''I am not able to add customer with invalid bank account number''', (tester) async {
      await theAppIsRunning(tester);
      await iAmOnTheAddCustomerScreen(tester);
      await iEnterIntoTheField(tester, "Mohsen", "First Name");
      await iEnterIntoTheField(tester, "Balestani", "Last Name");
      await iEnterIntoTheField(tester, "+989353361996", "Phone Number");
      await iEnterIntoTheField(tester, "m.balestani@gmail.com", "Email");
      await iEnterIntoTheField(tester, "1234567890", "Bank Account Number");
      await iShouldSeeToastOnTheScreen(tester, "Invalid bank account number");
    });
    testWidgets('''I am able to add customer with valid data''', (tester) async {
      await theAppIsRunning(tester);
      await iAmOnTheAddCustomerScreen(tester);
      await iEnterIntoTheField(tester, "Mohsen", "First Name");
      await iEnterIntoTheField(tester, "Balestani", "Last Name");
      await iEnterIntoTheField(tester, "+989353361996", "Phone Number");
      await iEnterIntoTheField(tester, "m.balestani@gmail.com", "Email");
      await iEnterIntoTheField(tester, "IR123456789012345678901234", "Bank Account Number");
      await iEnterIntoTheField(tester, "1990-01-01", "Date of Birth");
      await iTapOnTheAddButton(tester);
      await iShouldSeeToastOnTheScreen(tester, "Customer added successfully");
    });
    testWidgets('''I am not able to add customer with not unique email''', (tester) async {
      await theAppIsRunning(tester);
      await iAmOnTheAddCustomerScreen(tester);
      await iEnterIntoTheField(tester, "John", "First Name");
      await iEnterIntoTheField(tester, "Doe", "Last Name");
      await iEnterIntoTheField(tester, "+989353361990", "Phone Number");
      await iEnterIntoTheField(tester, "m.balestani@gmail.com", "Email");
      await iEnterIntoTheField(tester, "IR123456789012345678901230", "Bank Account Number");
      await iEnterIntoTheField(tester, "1990-01-01", "Date of Birth");
      await iTapOnTheAddButton(tester);
      await iShouldSeeToastOnTheScreen(tester, "Customer with this email already exists");
    });
    testWidgets('''I am not able to add customer with not unique phone number''', (tester) async {
      await theAppIsRunning(tester);
      await iAmOnTheAddCustomerScreen(tester);
      await iEnterIntoTheField(tester, "John", "First Name");
      await iEnterIntoTheField(tester, "Doe", "Last Name");
      await iEnterIntoTheField(tester, "+989353361996", "Phone Number");
      await iEnterIntoTheField(tester, "john@gmail.com", "Email");
      await iEnterIntoTheField(tester, "IR123456789012345678901230", "Bank Account Number");
      await iEnterIntoTheField(tester, "1990-01-01", "Date of Birth");
      await iTapOnTheAddButton(tester);
      await iShouldSeeToastOnTheScreen(tester, "Customer with this phone number already exists");
    });
    testWidgets('''am not able to add customer because Customers must be unique in database: By `Firstname`, `Lastname` and `DateOfBirth`''', (tester) async {
      await theAppIsRunning(tester);
      await iAmOnTheAddCustomerScreen(tester);
      await iEnterIntoTheField(tester, "John", "First Name");
      await iEnterIntoTheField(tester, "Doe", "Last Name");
      await iEnterIntoTheField(tester, "+989353361996", "Phone Number");
      await iEnterIntoTheField(tester, "johni@gmail.com", "Email");
      await iEnterIntoTheField(tester, "IR123456789012345678401230", "Bank Account Number");
      await iEnterIntoTheField(tester, "1990-01-01", "Date of Birth");
      await iTapOnTheAddButton(tester);
      await iShouldSeeToastOnTheScreen(tester, "Customer already exists");
    });
  });
}

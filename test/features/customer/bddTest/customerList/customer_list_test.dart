// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_import, directives_ordering

@Tags(['customerList'])
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import './step/customer_deleted_successfully.dart';
import './step/i_have_failed_to_load_customer_list.dart';
import './step/i_have_no_customers.dart';
import './step/i_have_one_customer.dart';
import './step/i_request_customer_list.dart';
import './step/i_see_add_customer_page.dart';
import './step/i_see_empty_list_widget.dart';
import './step/i_see_failed_to_load_customer_list_text.dart';
import './step/i_see_one_customer_in_the_list.dart';
import './step/i_see_update_customer_page.dart';
import './step/i_tap_add_customer_button.dart';
import './step/i_tap_delete_customer_button.dart';
import './step/i_tap_update_customer_button.dart';
import './step/the_app_is_running.dart';

void main() {
  group('''Customer List''', () {
    testWidgets('''customer list is empty at start''', (tester) async {
      await theAppIsRunning(tester, 0);
      await iHaveNoCustomers(tester);
      await iRequestCustomerList(tester);
      await iSeeEmptyListWidget(tester);
    });
    testWidgets('''customer list is not empty''', (tester) async {
      await theAppIsRunning(tester, 1);
      await iHaveOneCustomer(tester);
      await iRequestCustomerList(tester);
      await iSeeOneCustomerInTheList(tester);
    });
    testWidgets('''failed to load customer list''', (tester) async {
      await theAppIsRunning(tester, -1);
      await iHaveOneCustomer(tester);
      await iHaveFailedToLoadCustomerList(tester);
      await iRequestCustomerList(tester);
      await iSeeFailedToLoadCustomerListText(tester);
    });
    testWidgets('''delete customer success''', (tester) async {
      await theAppIsRunning(tester, 1);
      await iHaveOneCustomer(tester);
      await iRequestCustomerList(tester);
      await iTapDeleteCustomerButton(tester);
      await customerDeletedSuccessfully(tester);
    });
    testWidgets('''delete customer failed''', (tester) async {
      await theAppIsRunning(tester, 1);
      await iHaveOneCustomer(tester);
      await iRequestCustomerList(tester);
      await iTapDeleteCustomerButton(tester);
      await iSeeOneCustomerInTheList(tester);
    });
    testWidgets('''navigate to update customer page''', (tester) async {
      await theAppIsRunning(tester, 1);
      await iTapUpdateCustomerButton(tester);
      await iSeeUpdateCustomerPage(tester);
    });
    testWidgets('''click in add customer button''', (tester) async {
      await theAppIsRunning(tester, 1);
      await iTapAddCustomerButton(tester);
      await iSeeAddCustomerPage(tester);
    });
  });
}

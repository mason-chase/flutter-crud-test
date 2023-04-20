// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_import, directives_ordering

@Tags(['customerList'])
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import './step/the_app_is_running.dart';
import './step/see_customer_list_page.dart';
import './step/i_have_no_customers.dart';
import './step/i_request_customer_list.dart';
import './step/i_see_no_customers_found_text.dart';
import './step/i_have_one_customer.dart';
import './step/i_see_one_customer_in_the_list.dart';
import './step/i_have_failed_to_load_customer_list.dart';
import './step/i_see_failed_to_load_customer_list_text.dart';
import './step/i_tap_add_customer_button.dart';
import './step/i_see_add_customer_page.dart';

void main() {
  group('''Customer List''', () {
    Future<void> bddSetUp(WidgetTester tester) async {
      await theAppIsRunning(tester);
      await seeCustomerListPage(tester);
    }
    testWidgets('''customer list is empty at start''', (tester) async {
      await bddSetUp(tester);
      await iHaveNoCustomers(tester);
      await iRequestCustomerList(tester);
      await iSeeNoCustomersFoundText(tester);
    });
    testWidgets('''customer list is not empty''', (tester) async {
      await bddSetUp(tester);
      await iHaveOneCustomer(tester);
      await iRequestCustomerList(tester);
      await iSeeOneCustomerInTheList(tester);
    });
    testWidgets('''failed to load customer list''', (tester) async {
      await bddSetUp(tester);
      await iHaveOneCustomer(tester);
      await iHaveFailedToLoadCustomerList(tester);
      await iRequestCustomerList(tester);
      await iSeeFailedToLoadCustomerListText(tester);
    });
    testWidgets('''click in add customer button''', (tester) async {
      await bddSetUp(tester);
      await iTapAddCustomerButton(tester);
      await iSeeAddCustomerPage(tester);
    });
  });
}

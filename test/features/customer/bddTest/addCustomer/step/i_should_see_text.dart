import 'package:flutter_test/flutter_test.dart';
import 'package:mc_crud_test/core/utils/app.utils.dart';
import 'package:mc_crud_test/features/customer/presentation/addCustomer/bloc/add_customer.bloc.dart';

import '../../../../test_injection_helper.dart';

Future<void> iShouldSeeText(WidgetTester tester, dynamic param1) async {
   expect(find.text(param1), findsWidgets);
   resetInjection();

}

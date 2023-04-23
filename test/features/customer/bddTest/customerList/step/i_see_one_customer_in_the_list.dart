import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mc_crud_test/core/utils/app.utils.dart';
import 'package:mc_crud_test/features/customer/presentation/customerList/bloc/customer_list.bloc.dart';
import 'package:mc_crud_test/features/customer/presentation/customerList/bloc/customer_list.state.dart';

import '../../../../test_injection_helper.dart';
import '../../../customer_test.constants.dart';

Future<void> iSeeOneCustomerInTheList(WidgetTester tester) async {
  var bloc = getIt<CustomerListBloc>();
  whenListen(bloc, Stream.fromIterable([ListLoaded(tCustomerList)]),
      initialState: ListLoaded(tCustomerList));
  await tester.pumpAndSettle();
  expect(find.byType(ListView), findsOneWidget);
  expect(
      (find.byType(ListView).evaluate().first.widget as ListView)
          .semanticChildCount,
      1);
  resetInjection();
}

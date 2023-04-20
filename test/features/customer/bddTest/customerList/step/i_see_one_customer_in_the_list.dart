import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mc_crud_test/core/utils/app.utils.dart';
import 'package:mc_crud_test/features/customer/presentation/customerList/bloc/customer_list.bloc.dart';
import 'package:mc_crud_test/features/customer/presentation/customerList/bloc/customer_list.state.dart';
import 'package:mc_crud_test/features/customer/presentation/customerList/customer_list.page.dart';
import 'package:mc_crud_test/features/customer/presentation/customerList/widgets/customer_list_empty.widget.dart';
import 'package:mockito/mockito.dart';

import '../../../customer_test.constants.dart';
import '../test_injection_helper.dart';
import 'the_app_is_running.dart';

Future<void> iSeeOneCustomerInTheList(WidgetTester tester) async {
  var bloc = getIt<CustomerListBloc>();
  whenListen(bloc, Stream.fromIterable([ListLoaded([])]),
      initialState: ListLoaded(tCustomerList));
  await tester.pumpAndSettle();
  expect(find.byType(ListView), findsOneWidget);
  expect(
      (find.byType(ListView).evaluate().first.widget as ListView)
          .semanticChildCount,
      1);
  resetInjection();
}

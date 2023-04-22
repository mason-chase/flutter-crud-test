import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mc_crud_test/core/utils/app.utils.dart';
import 'package:mc_crud_test/features/customer/presentation/customerList/bloc/customer_list.bloc.dart';
import 'package:mc_crud_test/features/customer/presentation/customerList/bloc/customer_list.state.dart';
import 'package:mc_crud_test/features/customer/presentation/customerList/widgets/customer_list_error.widget.dart';

import '../../../../test_injection_helper.dart';

Future<void> iSeeFailedToLoadCustomerListText(WidgetTester tester) async {
  var bloc = getIt<CustomerListBloc>();
  whenListen(bloc, Stream.fromIterable([Error("Error")]),
      initialState: Error("Error"));
  await tester.pumpAndSettle();
  expect(find.byType(CustomerListErrorWidget), findsOneWidget);
  resetInjection();
}

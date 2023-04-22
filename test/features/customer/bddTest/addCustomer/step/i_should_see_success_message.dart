import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mc_crud_test/core/models/status.enum.dart';
import 'package:mc_crud_test/core/utils/app.utils.dart';
import 'package:mc_crud_test/features/customer/presentation/addCustomer/bloc/add_customer.bloc.dart';
import 'package:mc_crud_test/features/customer/presentation/addCustomer/bloc/add_customer.state.dart';

import '../../../../test_injection_helper.dart';

Future<void> iShouldSeeSuccessMessage(WidgetTester tester) async {
  var bloc = getIt<AddCustomerBloc>();
  whenListen<AddCustomerState>(
      bloc,
      Stream.fromIterable(
        [
          const AddCustomerInitial().copyWith(
            status: Status.success,
          )
        ],
      ),
      initialState: const AddCustomerInitial().copyWith(
        status: Status.success,
      ));

  expect(bloc.state.status, Status.success);
  resetInjection();
}

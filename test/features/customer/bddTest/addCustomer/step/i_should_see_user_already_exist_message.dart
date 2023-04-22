import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mc_crud_test/core/models/status.enum.dart';
import 'package:mc_crud_test/core/utils/app.utils.dart';
import 'package:mc_crud_test/features/customer/presentation/addCustomer/bloc/add_customer.bloc.dart';
import 'package:mc_crud_test/features/customer/presentation/addCustomer/bloc/add_customer.state.dart';

import '../../../../test_injection_helper.dart';

Future<void> iShouldSeeUserAlreadyExistMessage(WidgetTester tester) async {
  var bloc = getIt<AddCustomerBloc>();
  whenListen<AddCustomerState>(
      bloc,
      Stream.fromIterable(
        [
          const AddCustomerInitial().copyWith(
              status: Status.error,
              errorMessage:
                  "user fail to add customer because customer all ready exist")
        ],
      ),
      initialState: const AddCustomerInitial().copyWith(
          status: Status.error,
          errorMessage:
              "user fail to add customer because customer all ready exist"));

  expect(bloc.state.status, Status.error);
  resetInjection();
}

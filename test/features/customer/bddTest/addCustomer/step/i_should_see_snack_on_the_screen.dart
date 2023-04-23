import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mc_crud_test/core/models/status.enum.dart';
import 'package:mc_crud_test/core/utils/app.utils.dart';
import 'package:mc_crud_test/features/customer/presentation/addCustomer/bloc/add_customer.bloc.dart';
import 'package:mc_crud_test/features/customer/presentation/addCustomer/bloc/add_customer.state.dart';

import '../../../customer_test.constants.dart';

Future<void> iShouldSeeSnackOnTheScreen(
    WidgetTester tester, dynamic param1) async {
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

}

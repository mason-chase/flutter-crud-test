import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mc_crud_test/core/models/status.enum.dart';
import 'package:mc_crud_test/core/utils/app.utils.dart';
import 'package:mc_crud_test/features/customer/presentation/addCustomer/bloc/add_customer.bloc.dart';
import 'package:mc_crud_test/features/customer/presentation/addCustomer/bloc/add_customer.state.dart';
Future<void> iShouldSeeFailedMessage(WidgetTester tester) async {
  var bloc = getIt<AddCustomerBloc>();
  whenListen<AddCustomerState>(
      bloc,
      Stream.fromIterable(
        [
          const AddCustomerInitial().copyWith(
            status: Status.error,
            errorMessage: "Error"
          )
        ],
      ),
      initialState: const AddCustomerInitial().copyWith(
        status: Status.error,
        errorMessage: "Error"
      ));

  expect(bloc.state.status, Status.error);
}

import 'package:flutter_test/flutter_test.dart';
import 'package:mc_crud_test/core/utils/app.utils.dart';
import 'package:mc_crud_test/features/customer/presentation/customerList/bloc/customer_list.bloc.dart';
import 'package:mc_crud_test/features/customer/presentation/customerList/bloc/customer_list.event.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../test_injection_helper.dart';
import '../../../customer_test.constants.dart';

Future<void> customerDeletedSuccessfully(WidgetTester tester) async {
  var bloc = getIt<CustomerListBloc>();
  verify(() => bloc.add(DeleteCustomer(tCustomerList[0]))).called(1);
  resetInjection();
}

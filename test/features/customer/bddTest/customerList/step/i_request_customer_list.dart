import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mc_crud_test/core/utils/app.utils.dart';
import 'package:mc_crud_test/features/customer/presentation/customerList/bloc/customer_list.bloc.dart';
import 'package:mc_crud_test/features/customer/presentation/customerList/bloc/customer_list.event.dart';

import '../../../customer_test.constants.dart';



Future<void> iRequestCustomerList(WidgetTester tester) async {
  var bloc = getIt<CustomerListBloc>();
  bloc.add(GetCustomerList());
}

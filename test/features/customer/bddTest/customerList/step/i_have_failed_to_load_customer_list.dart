import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mc_crud_test/core/utils/app.utils.dart';
import 'package:mc_crud_test/features/customer/domain/customer.respository.dart';
import 'package:mockito/mockito.dart';

import '../../../customer_test.constants.dart';

Future<void> iHaveFailedToLoadCustomerList(WidgetTester tester) async {
  var repository = getIt<CustomerRepository>();
  when(repository.getCustomerList())
      .thenAnswer((_) async => const Left(tFailure));
  var result = await repository.getCustomerList();
  expect(result, const Left(tFailure));
}

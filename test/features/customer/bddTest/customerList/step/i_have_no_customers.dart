import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mc_crud_test/core/utils/app.utils.dart';
import 'package:mc_crud_test/features/customer/domain/customer.entity.dart';
import 'package:mc_crud_test/features/customer/domain/customer.respository.dart';
import 'package:mockito/mockito.dart';

Future<void> iHaveNoCustomers(WidgetTester tester) async {
  var repository = getIt<CustomerRepository>();
  when(repository.getCustomerList()).thenAnswer((_) async => const Right([]));

  var result = await repository.getCustomerList();
  expect(result, const Right(<Customer>[]));
}

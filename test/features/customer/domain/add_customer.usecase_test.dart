import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mc_crud_test/features/customer/domain/customer.respository.dart';
import 'package:mc_crud_test/features/customer/domain/usecases/add_customer.usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../customer_test.constants.dart';
import 'get_customer_list_usecases_test.mocks.dart';

@GenerateMocks([CustomerRepository])
void main() {
  final mockCustomerRepository = MockCustomerRepository();
  final useCase = AddCustomerUseCase(mockCustomerRepository);

  group('AddCustomer', () {
    test('should add customer to the repository', () async {
      // arrange
      when(mockCustomerRepository.addCustomer(tCustomer))
          .thenAnswer((_) async => const Right(tCustomer));
      // act
      final result = await useCase(tCustomer);
      // assert
      expect(result, const Right(tCustomer));

      verify(mockCustomerRepository.addCustomer(tCustomer));
      verifyNoMoreInteractions(mockCustomerRepository);
    });

    test('failed to add customer. user all ready exist', () async {
      // arrange
      when(mockCustomerRepository.addCustomer(tCustomer))
          .thenAnswer((_) async => const Left(tFailureAllReadyExist));
      // act
      final result = await useCase(tCustomer);
      // assert
      expect(result, const Left(tFailureAllReadyExist));

      verify(mockCustomerRepository.addCustomer(tCustomer));
      verifyNoMoreInteractions(mockCustomerRepository);
    });

    test('failed to add customer', () async {
      // arrange
      when(mockCustomerRepository.addCustomer(tCustomer))
          .thenAnswer((_) async => const Left(tFailure));
      // act
      final result = await useCase(tCustomer);
      // assert
      expect(result, const Left(tFailure));

      verify(mockCustomerRepository.addCustomer(tCustomer));
      verifyNoMoreInteractions(mockCustomerRepository);
    });
  });
}

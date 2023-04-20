import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mc_crud_test/features/customer/domain/customer.entity.dart';
import 'package:mc_crud_test/features/customer/domain/customer.respository.dart';
import 'package:mc_crud_test/features/customer/domain/usecases/get_customer_list.usecase.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import '../customer_test.constants.dart';
import 'customer_usecases_test.mocks.dart';

@GenerateMocks([CustomerRepository])

void main() {
  final mockCustomerRepository = MockCustomerRepository();
  final usecase = GetCustomerListUseCase(mockCustomerRepository);

  group('GetCustomerList', () {
    test('should get customer list from the repository with empty response',
        () async {
      // arrange
      when(mockCustomerRepository.getCustomerList())
          .thenAnswer((_) async => const Right([]));
      // act
      final result = await usecase();
      // assert
      expect(result, const Right(<Customer>[]));

      verify(mockCustomerRepository.getCustomerList());
      verifyNoMoreInteractions(mockCustomerRepository);
    });

    test('should get customer list from the repository with one item',
        () async {
      // arrange
      when(mockCustomerRepository.getCustomerList())
          .thenAnswer((_) async => const Right(tCustomerList));
      // act
      final result = await usecase();
      // assert
      expect(result, const Right(tCustomerList));

      verify(mockCustomerRepository.getCustomerList());
      verifyNoMoreInteractions(mockCustomerRepository);
    });


    test('//failed to get customer list',
        () async {
      // arrange
      when(mockCustomerRepository.getCustomerList())
          .thenAnswer((_) async => const Left(tFailure));
      // act
      final result = await usecase();
      // assert
      expect(result, const Left(tFailure));

      verify(mockCustomerRepository.getCustomerList());
      verifyNoMoreInteractions(mockCustomerRepository);
    }
    );

  });
}

import 'package:dartz/dartz.dart';
import 'package:mc_crud_test/core/error/failures.dart';
import 'package:mc_crud_test/features/customer/domain/entities/customer.dart';
import 'package:mc_crud_test/features/customer/domain/repositories/customer_repository.dart';
import 'package:mc_crud_test/features/customer/domain/repositories/customer_repository.mocks.dart';
import 'package:mc_crud_test/features/customer/domain/usecases/get_customer_by_id_usecase.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late GetCustomerByIdUseCase useCase;
  late CustomerRepository mockRepository;

  setUp(() {
    mockRepository = MockCustomerRepository();
    useCase = GetCustomerByIdUseCase(repository: mockRepository);
  });

  final tCustomer = Customer(
      firstname: 'firstname',
      lastname: 'lastname',
      dateOfBirth: 'dateOfBirth',
      phoneNumber: 'phoneNumber',
      email: 'email',
      bankAccountNumber: 'bankAccountNumber');

  const String tId = "test";

  test('should get a customer by id from the repository', () async {
    when(mockRepository.getCustomerById(tId))
        .thenAnswer((_) async => Right(tCustomer));

    final result = await useCase(params: tId);
    verify(mockRepository.getCustomerById(tId));

    result.fold(
      (l) => {
        expect(l, equals(const DatabaseFailure(""))),
        verifyZeroInteractions(mockRepository),
      },
      (r) => {
        expect(r, equals(tCustomer)),
        verifyNoMoreInteractions(mockRepository),
      },
    );
  });
}

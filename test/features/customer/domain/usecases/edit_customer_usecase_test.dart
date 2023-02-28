import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mc_crud_test/core/error/failures.dart';
import 'package:mc_crud_test/features/customer/domain/entities/customer.dart';
import 'package:mc_crud_test/features/customer/domain/repositories/customer_repository.dart';
import 'package:mc_crud_test/features/customer/domain/repositories/customer_repository.mocks.dart';
import 'package:mc_crud_test/features/customer/domain/usecases/edit_customer_usecase.dart';
import 'package:mockito/mockito.dart';

void main() {
  late final EditCustomerUseCase useCase;
  late final CustomerRepository mockRepository;

  setUp(() {
    mockRepository = MockCustomerRepository();
    useCase = EditCustomerUseCase(repository: mockRepository);
  });

  final tCustomer = Customer(
      firstname: 'firstname',
      lastname: 'lastname',
      dateOfBirth: 'dateOfBirth',
      phoneNumber: 'phoneNumber',
      email: 'email',
      bankAccountNumber: 'bankAccountNumber');

  test('Should edit the customer in UseCase part.', () async {
    when(mockRepository.editCustomer(tCustomer))
        .thenAnswer((realInvocation) async => Right(tCustomer));

    final result = await useCase(params: tCustomer);
    verify(mockRepository.editCustomer(tCustomer));
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

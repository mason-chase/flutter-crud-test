import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mc_crud_test/core/error/failures.dart';
import 'package:mc_crud_test/features/customer/domain/entities/customer.dart';
import 'package:mc_crud_test/features/customer/domain/repositories/customer_repository.dart';
import 'package:mc_crud_test/features/customer/domain/repositories/customer_repository.mocks.dart';
import 'package:mc_crud_test/features/customer/domain/usecases/add_customer_usecase.dart';
import 'package:mockito/mockito.dart';

void main() {
  late final AddCustomerUseCase useCase;
  late final CustomerRepository mockRepository;

  setUp(() {
    mockRepository = MockCustomerRepository();
    useCase = AddCustomerUseCase(repository: mockRepository);
  });

  final tCustomer = Customer(
      firstname: 'firstname',
      lastname: 'lastname',
      dateOfBirth: 'dateOfBirth',
      phoneNumber: 'phoneNumber',
      email: 'email',
      bankAccountNumber: 'bankAccountNumber');

  test('Should Add a customer in UseCase part.', () async {
    when(mockRepository.addCustomer(tCustomer))
        .thenAnswer((realInvocation) async => Right(tCustomer));

    final result = await useCase(params: tCustomer);
    verify(mockRepository.addCustomer(tCustomer));

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

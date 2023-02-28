import 'package:dartz/dartz.dart';
import 'package:mc_crud_test/core/error/failures.dart';
import 'package:mc_crud_test/features/customer/domain/entities/customer.dart';
import 'package:mc_crud_test/features/customer/domain/repositories/customer_repository.dart';
import 'package:mc_crud_test/features/customer/domain/repositories/customer_repository.mocks.dart';
import 'package:mc_crud_test/features/customer/domain/usecases/get_customers_usecase.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late GetCustomersUseCase useCase;
  late CustomerRepository mockRepository;

  setUp(() {
    mockRepository = MockCustomerRepository();
    useCase = GetCustomersUseCase(repository: mockRepository);
  });

  final List<Customer> tCustomer = [
    Customer(
        firstname: 'firstname',
        lastname: 'lastname',
        dateOfBirth: 'dateOfBirth',
        phoneNumber: 'phoneNumber',
        email: 'email',
        bankAccountNumber: 'bankAccountNumber'),
  ];

  test('should get all customers from the repository', () async {
    when(mockRepository.getCustomers())
        .thenAnswer((_) async => Right(tCustomer));

    final result = await useCase(params: null);
    verify(mockRepository.getCustomers());
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

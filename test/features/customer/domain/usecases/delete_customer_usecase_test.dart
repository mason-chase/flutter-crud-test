import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mc_crud_test/features/customer/domain/repositories/customer_repository.dart';
import 'package:mc_crud_test/features/customer/domain/repositories/customer_repository.mocks.dart';
import 'package:mc_crud_test/features/customer/domain/usecases/delete_customer_usecase.dart';
import 'package:mockito/mockito.dart';

void main() {
  late final DeleteCustomerUseCase useCase;
  late final CustomerRepository mockRepository;

  setUp(() {
    mockRepository = MockCustomerRepository();
    useCase = DeleteCustomerUseCase(repository: mockRepository);
  });

  const String tId = "test";

  test('Should delete the customer in UseCase part.', () async {
    when(mockRepository.deleteCustomer(tId))
        .thenAnswer((realInvocation) async => const Right(null));

    final result = await useCase(params: tId);
    verify(mockRepository.deleteCustomer(tId));
    expect(result, equals(const Right(null)));
    verifyNoMoreInteractions(mockRepository);
  });
}

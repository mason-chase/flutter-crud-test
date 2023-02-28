import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mc_crud_test/core/error/failures.dart';
import 'package:mc_crud_test/features/customer/data/datasources/customer_local_data_source.dart';
import 'package:mc_crud_test/features/customer/data/datasources/customer_local_data_source.mocks.dart';
import 'package:mc_crud_test/features/customer/data/repositories/customer_repository_impl.dart';
import 'package:mc_crud_test/features/customer/domain/entities/customer.dart';
import 'package:mockito/mockito.dart';


void main() {
  late CustomerRepositoryImpl repository;
  late CustomerLocalDataSource mockLocalDataSource;

  setUp(() {
    mockLocalDataSource = MockCustomerLocalDataSource();
    repository = CustomerRepositoryImpl(
      localDataSource: mockLocalDataSource,
    );
  });

  final List<Customer> tCustomers = [
    Customer(
        firstname: 'firstname',
        lastname: 'lastname',
        dateOfBirth: 'dateOfBirth',
        phoneNumber: 'phoneNumber',
        email: 'email',
        bankAccountNumber: 'bankAccountNumber'),
  ];

  final tCustomer = Customer(
      firstname: 'firstname',
      lastname: 'lastname',
      dateOfBirth: 'dateOfBirth',
      phoneNumber: 'phoneNumber',
      email: 'email',
      bankAccountNumber: 'bankAccountNumber');

  const String tId = "test";

  group('Customer repository implementation test', () {
    test("Should get all Customers from db", () async {
      when(mockLocalDataSource.getCustomers())
          .thenAnswer((realInvocation) async => tCustomers);

      final result = await repository.getCustomers();

      verify(mockLocalDataSource.getCustomers());
      expect(result, equals(Right(tCustomers)));
      verifyNoMoreInteractions(mockLocalDataSource);
    });

    test("Should get a Customer by id from db", () async {
      when(mockLocalDataSource.getCustomerById(tId))
          .thenAnswer((realInvocation) async => tCustomer);

      final result = await repository.getCustomerById(tId);
      verify(mockLocalDataSource.getCustomerById(tId));
      expect(result, equals(Right(tCustomer)));
      verifyNoMoreInteractions(mockLocalDataSource);
    });

    test("Should edit the Customer by Customer model from db", () async {
      when(mockLocalDataSource.editCustomer(tCustomer))
          .thenAnswer((realInvocation) async => tCustomer);

      final result = await repository.editCustomer(tCustomer);

      verify(mockLocalDataSource.editCustomer(tCustomer));
      expect(result, equals(Right(tCustomer)));
      verifyNoMoreInteractions(mockLocalDataSource);
    });

    test("Should delete the Customer by id from db", () async {
      when(mockLocalDataSource.deleteCustomer(tId))
          .thenAnswer((realInvocation) async {});
      final result = await repository.deleteCustomer(tId);
      verify(mockLocalDataSource.deleteCustomer(tId));
      expect(result, equals(const Right(null)));
      verifyNoMoreInteractions(mockLocalDataSource);
    });

    test("Should add a Customer in db", () async {
      when(mockLocalDataSource.addCustomer(tCustomer))
          .thenAnswer((realInvocation) async => tCustomer);

      final result = await repository.addCustomer(tCustomer);
      verify(mockLocalDataSource.addCustomer(tCustomer));

      result.fold(
        (l) => {
          expect(l, equals(const DatabaseFailure(""))),
          verifyZeroInteractions(mockLocalDataSource),
        },
        (r) => {
          expect(r, equals(tCustomer)),
        },
      );
    });
  });
}

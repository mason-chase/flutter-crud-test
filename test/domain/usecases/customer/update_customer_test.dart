import 'package:dartz/dartz.dart';
import 'package:mc_crud_test/core/customer/data/datasource/customer_local_datasource.dart';
import 'package:mc_crud_test/core/customer/data/dto/customer_dto.dart';
import 'package:mc_crud_test/core/customer/data/repository/customer/customer_repository.dart';
import 'package:mc_crud_test/core/customer/domain/usecase/customer/add_customer_usecase.dart';
import 'package:mc_crud_test/core/customer/domain/usecase/customer/update_customer_usecase.dart';
import 'package:mc_crud_test/core/error/failures.dart';
import 'package:mockito/mockito.dart';
import 'package:mc_crud_test/core/customer/domain/usecase/customer/get_customer_list_usecase.dart';
import 'package:mc_crud_test/core/customer/domain/repository/interfaces/customer_repository_impl.dart';
import 'package:mockito/annotations.dart';
import 'package:flutter_test/flutter_test.dart';

import 'update_customer_test.mocks.dart';

@GenerateMocks([CustomerLocalDataSource])
void main() {
  late CustomerLocalDataSource mockCustomerLocalDataSource;
  late UpdateCustomer usecases;
  CustomerDTO customerData = CustomerDTO.fromJson({
    "firstName": "testFirstName10",
    "lastName": "testLastName10",
    "dateOfBirth": "010101",
    "phoneNumber": "1234567890",
    "email": "test@email.com",
    "bankAcountNumber": "1234567890"
  });

  setUp(() {
    mockCustomerLocalDataSource = MockCustomerLocalDataSource();
    usecases = UpdateCustomerImpl(mockCustomerLocalDataSource, customerData, 0);
  });

  test("should update existing customer", () async {
    const Either<Failure, String> repoResult =
        Right<Failure, String>("Customer updated");

    when(mockCustomerLocalDataSource.updateCustomer(
            customer: customerData, index: 0))
        .thenAnswer((_) async => repoResult);

    final result = await usecases.execute();

    result.map((r) => print(r));

    expect(result, equals(repoResult));
    verify(mockCustomerLocalDataSource.updateCustomer(
        customer: customerData, index: 0));
  });
}

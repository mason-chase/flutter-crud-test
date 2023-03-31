import 'package:dartz/dartz.dart';
import 'package:mc_crud_test/core/customer/data/datasource/customer_local_datasource.dart';
import 'package:mc_crud_test/core/customer/data/dto/customer_dto.dart';
import 'package:mc_crud_test/core/error/failures.dart';
import 'package:mockito/mockito.dart';
import 'package:mc_crud_test/core/customer/domain/usecase/customer/get_customer_list_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:flutter_test/flutter_test.dart';

import 'get_all_customers_test.mocks.dart';

@GenerateMocks([CustomerLocalDataSource])
void main() {
  late CustomerLocalDataSource mockCustomerLocalDataSource;
  late GetAllCustomers usecases;

  setUp(() {
    mockCustomerLocalDataSource = MockCustomerLocalDataSource();
    usecases = GetAllCustomersImpl(mockCustomerLocalDataSource);
  });

  test("should get all customers from the customer repository", () async {
    Either<Failure, List<CustomerDTO>> repoResult =
        Right<Failure, List<CustomerDTO>>([
      CustomerDTO.fromJson({
        "firstName": "testFirstName1",
        "lastName": "testLastName1",
        "dateOfBirth": "010101",
        "phoneNumber": "1234567890",
        "email": "test@email.com",
        "bankAcountNumber": "1234567890"
      }),
    ]);

    when(mockCustomerLocalDataSource.getCustomerList())
        .thenAnswer((_) async => repoResult);

    final result = await usecases.execute();

    expect(result, equals(repoResult));
    verify(mockCustomerLocalDataSource.getCustomerList());
  });
}

import 'package:dartz/dartz.dart';
import 'package:mc_crud_test/core/error/failures.dart';
import 'package:mc_crud_test/core/usecases/usecase.dart';
import 'package:mc_crud_test/features/customer/domain/entities/customer.dart';
import 'package:mc_crud_test/features/customer/domain/repositories/customer_repository.dart';

class AddCustomerUseCase implements UseCase<Customer, Customer> {
  final CustomerRepository repository;

  AddCustomerUseCase({required this.repository});

  @override
  Future<Either<Failure, Customer>> call({required Customer params}) async {
    return await repository.addCustomer(params);
  }
}

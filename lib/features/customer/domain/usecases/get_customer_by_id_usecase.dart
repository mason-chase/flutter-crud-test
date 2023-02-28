import 'package:dartz/dartz.dart';
import 'package:mc_crud_test/core/error/failures.dart';
import 'package:mc_crud_test/core/usecases/usecase.dart';
import 'package:mc_crud_test/features/customer/domain/entities/customer.dart';
import 'package:mc_crud_test/features/customer/domain/repositories/customer_repository.dart';

class GetCustomerByIdUseCase implements UseCase<Customer?, String> {
  final CustomerRepository repository;

  GetCustomerByIdUseCase({required this.repository});

  @override
  Future<Either<Failure, Customer?>> call({required String params}) async {
    return await repository.getCustomerById(params);
  }
}

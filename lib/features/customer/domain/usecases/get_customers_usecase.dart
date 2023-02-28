import 'package:dartz/dartz.dart';
import 'package:mc_crud_test/core/error/failures.dart';
import 'package:mc_crud_test/core/usecases/usecase.dart';
import 'package:mc_crud_test/features/customer/domain/entities/customer.dart';
import 'package:mc_crud_test/features/customer/domain/repositories/customer_repository.dart';

class GetCustomersUseCase implements UseCase<List<Customer>, void> {
  final CustomerRepository repository;

  GetCustomersUseCase({required this.repository});

  @override
  Future<Either<Failure, List<Customer>>> call({required void params}) async {
    return await repository.getCustomers();
  }
}

import 'package:dartz/dartz.dart';
import 'package:mc_crud_test/core/error/failures.dart';
import 'package:mc_crud_test/core/usecases/usecase.dart';
import 'package:mc_crud_test/features/customer/domain/repositories/customer_repository.dart';

class DeleteCustomerUseCase implements UseCase<void, String> {
  final CustomerRepository repository;

  DeleteCustomerUseCase({required this.repository});

  @override
  Future<Either<Failure, void>> call({required String params}) async {
    return await repository.deleteCustomer(params);
  }
}

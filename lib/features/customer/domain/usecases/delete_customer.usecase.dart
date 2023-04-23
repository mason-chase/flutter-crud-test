import 'package:dartz/dartz.dart';
import 'package:mc_crud_test/core/models/failure.dart';
import 'package:mc_crud_test/features/customer/domain/customer.entity.dart';
import 'package:mc_crud_test/features/customer/domain/customer.respository.dart';

class DeleteCustomerUseCase {
  final CustomerRepository _repository;

  DeleteCustomerUseCase(this._repository);

  Future<Either<Failure, void>> call(Customer customer) async {
    return await _repository.deleteCustomer(customer);
  }
}

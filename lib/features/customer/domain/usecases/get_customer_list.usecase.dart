import 'package:dartz/dartz.dart';
import 'package:mc_crud_test/core/models/failure.dart';
import 'package:mc_crud_test/features/customer/domain/customer.entity.dart';
import 'package:mc_crud_test/features/customer/domain/customer.respository.dart';

class GetCustomerListUseCase {
  final CustomerRepository repository;

  GetCustomerListUseCase(this.repository);

  Future<Either<Failure, List<Customer>>> call() async {
    return await repository.getCustomerList();
  }
}

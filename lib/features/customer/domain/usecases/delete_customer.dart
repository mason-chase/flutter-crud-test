import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/create_customer/params/create_customer_params.dart';
import '../entities/create_customer/response/create_customer_response.dart';
import '../entities/delete_customer/params/delete_customer_params.dart';
import '../entities/delete_customer/response/delete_customer_response.dart';
import '../repository/repository.dart';

@lazySingleton
class DeleteCustomer
    extends UseCases<DeleteCustomerResponse, DeleteCustomerParams> {
  final CustomerRepository repository;

  DeleteCustomer(this.repository);

  @override
  Future<Either<Failure, DeleteCustomerResponse>> call(
          DeleteCustomerParams params) async =>
      await repository.deleteCustomer(params);
}

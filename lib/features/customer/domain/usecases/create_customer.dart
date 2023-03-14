import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/create_customer/params/create_customer_params.dart';
import '../entities/create_customer/response/create_customer_response.dart';
import '../repository/repository.dart';

@lazySingleton
class CreateCustomer
    extends UseCases<CreateCustomerResponse, CreateCustomerParams> {
  final CustomerRepository repository;

  CreateCustomer(this.repository);

  @override
  Future<Either<Failure, CreateCustomerResponse>> call(
          CreateCustomerParams params) async =>
      await repository.createCustomer(params);
}

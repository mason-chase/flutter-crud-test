import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/update_customer/params/update_customer_params.dart';
import '../entities/update_customer/response/update_customer_response.dart';
import '../repository/repository.dart';

@lazySingleton
class UpdateCustomer
    extends UseCases<UpdateCustomerResponse, UpdateCustomerParams> {
  final CustomerRepository repository;

  UpdateCustomer(this.repository);

  @override
  Future<Either<Failure, UpdateCustomerResponse>> call(
          UpdateCustomerParams params) async =>
      await repository.updateCustomer(params);
}

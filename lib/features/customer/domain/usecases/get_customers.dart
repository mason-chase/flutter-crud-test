import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/get_customers/params/get_customers_params.dart';
import '../entities/get_customers/response/get_customers_response.dart';
import '../repository/repository.dart';

@lazySingleton
class GetCustomers extends UseCases<GetCustomersResponse, GetCustomersParams> {
  final CustomerRepository repository;

  GetCustomers(this.repository);

  @override
  Future<Either<Failure, GetCustomersResponse>> call(
          GetCustomersParams params) async =>
      await repository.getCustomers(params);
}

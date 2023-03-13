import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/error_translator.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entities/create_customer/params/create_customer_params.dart';
import '../../domain/entities/create_customer/response/create_customer_response.dart';
import '../../domain/repository/repository.dart';
import '../datasource/datasource.dart';

@LazySingleton(as: CustomerRepository)
class CustomerRepositoryIMPL implements CustomerRepository {
  final CustomerDataSource dataSource;
  CustomerRepositoryIMPL(this.dataSource);

  @override
  Future<Either<Failure, CreateCustomerResponse>> createCustomer(
      CreateCustomerParams params) async {
    try {
      final CreateCustomerResponse response =
          await dataSource.createCustomer(params);
      return Right(response);
    } catch (err) {
      return Left(Failure(ErrorTranslator()(err)));
    }
  }
}

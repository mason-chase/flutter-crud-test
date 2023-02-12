import 'package:dartz/dartz.dart';

import '../../data/dtos/customer/customer_dto.dart';
import '../../shared_library/infrastructure/utils/failure.dart';
import '../entities/customer_entity.dart';

abstract class CustomerRepository {
  Future<Either<Failure, CustomerEntity>> addCustomer(final CustomerDto dto);
}

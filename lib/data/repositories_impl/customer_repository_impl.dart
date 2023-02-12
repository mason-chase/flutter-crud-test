import 'package:dartz/dartz.dart';

import '../../domain/entities/customer_entity.dart';
import '../../domain/repositories/customer_repository.dart';
import '../../shared_library/infrastructure/utils/failure.dart';
import '../dtos/customer/customer_dto.dart';
import '../local_data_sources/local_db_data_source.dart';

class CustomerRepositoryImpl extends CustomerRepository {
  final LocalDbDataSource _dataSource = LocalDbDataSource();

  @override
  Future<Either<Failure, CustomerEntity>> addCustomer(
      final CustomerDto dto) async {
    try {
      final result = await _dataSource.addCustomer(dto);
      return right(
        CustomerEntity.fromDto(id: result, dto: dto),
      );
    } on Exception catch (e) {
      return left(e as Failure);
    }
  }
}

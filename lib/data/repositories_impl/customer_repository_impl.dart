import 'package:dartz/dartz.dart';

import '../../domain/entities/customer_entity.dart';
import '../../domain/repositories/customer_repository.dart';
import '../../shared_library/infrastructure/utils/failure.dart';
import '../dtos/customer/customer_dto.dart';
import '../local_data_sources/local_db_data_source.dart';
import '../mappers/customer_mapper.dart';

class CustomerRepositoryImpl extends CustomerRepository {
  final LocalDbDataSource _dataSource = LocalDbDataSource();

  @override
  Future<Either<Failure, CustomerEntity>> addCustomer(
      final CustomerDto dto) async {
    try {
      final result = await _dataSource.addCustomer(dto);
      dto.id = result;
      return right(
        CustomerEntity.fromDto(dto: dto),
      );
    } on Exception catch (e) {
      return left(e as Failure);
    }
  }

  @override
  Future<Either<Failure, List<CustomerEntity>>> getAllCustomers() async {
    try {
      final result = await _dataSource.getAllCustomers();

      return right(result.map(CustomerMapper.mapDtoToEntity).toList());
    } on Exception catch (e) {
      return left(e as Failure);
    }
  }
}

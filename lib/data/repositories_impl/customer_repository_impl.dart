import 'package:dartz/dartz.dart';

import '../../domain/entities/customer_entity.dart';
import '../../domain/repositories/customer_repository.dart';
import '../dtos/customer/customer_dto.dart';
import '../local_data_sources/local_db_data_source.dart';
import '../mappers/customer_mapper.dart';

class CustomerRepositoryImpl extends CustomerRepository {
  final LocalDbDataSource _dataSource = LocalDbDataSource();

  @override
  Future<Either<Exception, CustomerEntity>> addCustomer(
      final CustomerDto dto) async {
    try {
      final result = await _dataSource.addCustomer(dto);
      dto.id = result;
      return right(
        CustomerEntity.fromDto(dto: dto),
      );
    } catch (e) {
      return left(e as Exception);
    }
  }

  @override
  Future<Either<Exception, List<CustomerEntity>>> getAllCustomers() async {
    try {
      final result = await _dataSource.getAllCustomers();

      return right(result.map(CustomerMapper.mapDtoToEntity).toList());
    } catch (e) {
      rethrow;
    }
  }
}

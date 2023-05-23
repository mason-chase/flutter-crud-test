import 'package:dartz/dartz.dart';
import 'package:mc_crud_test/core/customer/data/datasource/customer_local_datasource.dart';
import 'package:mc_crud_test/core/customer/data/dto/customer_dto.dart';
import 'package:mc_crud_test/core/customer/data/repository/customer/customer_repository.dart';
import 'package:mc_crud_test/core/error/failures.dart';

abstract class GetAllCustomers {
  Future<Either<Failure, List<CustomerDTO>>> execute();
}

class GetAllCustomersImpl implements GetAllCustomers {
  CustomerLocalDataSource customerLocalDataSource = CustomerLocalDataSource();

  GetAllCustomersImpl();

  @override
  Future<Either<Failure, List<CustomerDTO>>> execute() async {
    var result = await customerLocalDataSource.getCustomerList();
    return result;
  }
}

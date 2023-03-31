import 'package:dartz/dartz.dart';
import 'package:mc_crud_test/core/customer/data/datasource/customer_local_datasource.dart';
import 'package:mc_crud_test/core/customer/data/dto/customer_dto.dart';
import 'package:mc_crud_test/core/customer/data/repository/customer/customer_repository.dart';
import 'package:mc_crud_test/core/customer/domain/repository/interfaces/customer_repository_impl.dart';
import 'package:mc_crud_test/core/error/failures.dart';

abstract class AddCustomer {
  Future<Either<Failure, String>> execute();
}

class AddCustomerImpl implements AddCustomer {
  final CustomerLocalDataSource customerLocalDataSource;
  CustomerDTO customerData;

  AddCustomerImpl(this.customerLocalDataSource, this.customerData);

  @override
  Future<Either<Failure, String>> execute() async {
    var result = await customerLocalDataSource.addCustomer(customerData);

    return result;
  }
}

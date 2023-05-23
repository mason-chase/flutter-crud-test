import 'package:dartz/dartz.dart';
import 'package:mc_crud_test/core/customer/data/datasource/customer_local_datasource.dart';
import 'package:mc_crud_test/core/customer/data/dto/customer_dto.dart';
import 'package:mc_crud_test/core/customer/data/repository/customer/customer_repository.dart';
import 'package:mc_crud_test/core/customer/domain/repository/interfaces/customer_repository_impl.dart';
import 'package:mc_crud_test/core/error/failures.dart';

abstract class AddCustomer {
  Future<Either<Failure, CustomerAddedStatus>> execute();
}

class AddCustomerImpl implements AddCustomer {
  final CustomerLocalDataSource customerLocalDataSource = CustomerLocalDataSource();
  CustomerDTO customerData;

  AddCustomerImpl(this.customerData);

  @override
  Future<Either<Failure, CustomerAddedStatus>> execute() async {
    var result = await customerLocalDataSource.addCustomer(customerData);

    return result;
  }
}

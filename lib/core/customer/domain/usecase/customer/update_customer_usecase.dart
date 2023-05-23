import 'package:dartz/dartz.dart';
import 'package:mc_crud_test/core/customer/data/datasource/customer_local_datasource.dart';
import 'package:mc_crud_test/core/customer/data/dto/customer_dto.dart';
import 'package:mc_crud_test/core/customer/data/repository/customer/customer_repository.dart';
import 'package:mc_crud_test/core/customer/domain/repository/interfaces/customer_repository_impl.dart';
import 'package:mc_crud_test/core/error/failures.dart';

abstract class UpdateCustomer {
  Future<Either<Failure, CustomerUpdatedStatus>?> execute();
}

class UpdateCustomerImpl implements UpdateCustomer {
  final CustomerLocalDataSource customerLocalDataSource =
      CustomerLocalDataSource();
  CustomerDTO customerData;
  CustomerDTO oldCustomerData;
  int index;

  UpdateCustomerImpl(this.customerData, this.oldCustomerData, this.index);

  @override
  Future<Either<Failure, CustomerUpdatedStatus>?> execute() async {
    var result = await customerLocalDataSource.updateCustomer(
        customer: customerData, oldCustomer: oldCustomerData, index: index);

    return result;
  }
}

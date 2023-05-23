import 'package:dartz/dartz.dart';
import 'package:mc_crud_test/core/customer/data/datasource/customer_local_datasource.dart';
import 'package:mc_crud_test/core/customer/data/dto/customer_dto.dart';
import 'package:mc_crud_test/core/customer/data/repository/customer/customer_repository.dart';
import 'package:mc_crud_test/core/customer/domain/repository/interfaces/customer_repository_impl.dart';
import 'package:mc_crud_test/core/error/failures.dart';

abstract class DeleteCustomer {
  Future<Either<Failure, CustomerDeletedStatus>> execute();
}

class DeleteCustomerImpl implements DeleteCustomer {
  final CustomerLocalDataSource customerLocalDataSource = CustomerLocalDataSource();
  int index;

  DeleteCustomerImpl(this.index);

  @override
  Future<Either<Failure, CustomerDeletedStatus>> execute() async {
    var result = await customerLocalDataSource.deleteCustomer(index: index);

    return result;
  }
}

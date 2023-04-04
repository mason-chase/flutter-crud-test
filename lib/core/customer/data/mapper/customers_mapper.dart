import 'package:dartz/dartz.dart';
import 'package:mc_crud_test/core/customer/data/dto/customer_dto.dart';
import 'package:mc_crud_test/core/customer/domain/entity/customer_entity.dart';
import 'package:mc_crud_test/core/customer/domain/usecase/customer/add_customer_usecase.dart';
import 'package:mc_crud_test/core/customer/domain/usecase/customer/delete_customer_usecase.dart';
import 'package:mc_crud_test/core/customer/domain/usecase/customer/get_customer_list_usecase.dart';
import 'package:mc_crud_test/core/customer/domain/usecase/customer/update_customer_usecase.dart';
import 'package:mc_crud_test/core/error/failures.dart';

class CustomerMapper {
  CustomerMapper({
    this.customerEntity,
    this.customerDTO,
    this.addCustomerUseCase,
    this.updateCustomerUseCase,
    this.deleteCustomerUseCase,
  });
  final CustomerEntity? customerEntity;
  final CustomerDTO? customerDTO;
  final AddCustomerImpl? addCustomerUseCase;
  final GetAllCustomersImpl getAllCustomersUseCase = GetAllCustomersImpl();
  final UpdateCustomer? updateCustomerUseCase;
  final DeleteCustomer? deleteCustomerUseCase;

  Future<Either<Failure, List<CustomerEntity>>> getAllCustomers() async {
    try {
      var customers = await getAllCustomersUseCase.execute();
      List<CustomerDTO>? customerList = customers.getOrElse(() => []);

      List<CustomerEntity> customersEntityList = [];
      print("lenght = ${customerList.length}");
      customerList.forEach((customer) {
        customersEntityList.add(CustomerEntity(
            firstName: customer.firstName ?? "",
            lastName: customer.lastName ?? "",
            dateOfBirth: customer.dateOfBirth ?? "",
            phoneNumber: customer.phoneNumber ?? "",
            email: customer.email ?? "",
            bankAcountNumber: customer.bankAcountNumber ?? ""));
      });

      return Right(customersEntityList);
    } catch (e) {
      return const Right([]);
    }
  }
}

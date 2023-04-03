import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mc_crud_test/core/customer/data/dto/customer_dto.dart';
import 'package:mc_crud_test/core/customer/domain/usecase/customer/add_customer_usecase.dart';
import 'package:mc_crud_test/core/customer/domain/usecase/customer/delete_customer_usecase.dart';
import 'package:mc_crud_test/core/customer/domain/usecase/customer/get_customer_list_usecase.dart';
import 'package:mc_crud_test/core/customer/domain/usecase/customer/update_customer_usecase.dart';
import 'package:mc_crud_test/feature/customer/bloc/customer_bloc.dart';
import 'package:mc_crud_test/feature/customer/page/customer_add_page.dart';
import 'package:mc_crud_test/feature/customer/page/customer_list_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiRepositoryProvider(
          providers: [
            RepositoryProvider(
              create: (context) => AddCustomerImpl(CustomerDTO.fromJson({})),
            ),
            RepositoryProvider(
              create: (context) => GetAllCustomersImpl(),
            ),
            RepositoryProvider(
                create: (context) =>
                    UpdateCustomerImpl(CustomerDTO.fromJson({}), 0)),
            RepositoryProvider(create: (context) => DeleteCustomerImpl(0)),
          ],
          child: BlocProvider<CustomerBloc>(
            create: (context) {
              return CustomerBloc(
                  getAllCustomersUseCase: GetAllCustomersImpl(),
                  addCustomerUseCase: AddCustomerImpl(CustomerDTO.fromJson({})),
                  updateCustomerUseCase:
                      UpdateCustomerImpl(CustomerDTO.fromJson({}), 0),
                  deleteCustomerUseCase: DeleteCustomerImpl(0));
            },
            child: CustomersListPage(),
          )),
    );
  }
}

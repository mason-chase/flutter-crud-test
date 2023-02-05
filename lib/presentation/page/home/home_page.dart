import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:mc_crud_test/application/core/core_state.dart';
import 'package:mc_crud_test/application/customer/get_all_customer/get_all_customer_cubit.dart';
import 'package:mc_crud_test/domain/customer/entity/customer_entity.dart';
import 'package:mc_crud_test/presentation/page/home/widget/customer_list_body.dart';
import 'package:mc_crud_test/presentation/routing/routing.dart';
import 'package:mc_crud_test/presentation/theme/icony.dart';
import 'package:mc_crud_test/presentation/widget/app_bar/custom_app_bar.dart';
import 'package:mc_crud_test/presentation/widget/loading.dart';
import 'package:mc_crud_test/presentation/widget/show_status.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar.logo(),
      body: BlocBuilder<GetAllCustomerCubit, CoreState<List<CustomerEntity>>>(
        builder: (context, state) => state.map(
          initial: (_) => const SizedBox.shrink(),
          loadInProgress: (_) => const Loading(),
          fetchDataFailure: (_) => const ShowStatus(
            icon: Icony.closeCircleBold,
            iconSize: 30,
            isError: true,
            title: "Can't fetch data",
            description: 'Unfortunately, we could not display the list of customers',
          ),
          fetchDataSuccessfully: (customers) => CustomerListBody(customers: customers.data),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push(Routing.addCustomerPage),
        child: SvgPicture.asset(
          Icony.addPerson,
          color: Colors.white,
        ),
      ),
    );
  }
}

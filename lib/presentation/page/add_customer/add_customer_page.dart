import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hero_button/hero_button.dart';
import 'package:mc_crud_test/application/customer/add_customer/add_customer_bloc.dart';
import 'package:mc_crud_test/domain/customer/entity/customer_entity.dart';
import 'package:mc_crud_test/injection.dart';
import 'package:mc_crud_test/presentation/page/add_customer/widget/add_customer_form.dart';
import 'package:mc_crud_test/presentation/widget/app_bar/custom_app_bar.dart';
import 'package:mc_crud_test/presentation/widget/spacer_column_with_fixed_submit_button.dart';
import 'package:mc_crud_test/presentation/widget/title_and_description_column.dart';

class AddCustomerPage extends StatelessWidget {
  final CustomerEntity? initialCustomer;

  const AddCustomerPage({Key? key, this.initialCustomer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<AddCustomerBloc>()..add(AddCustomerEvent.initialCustomer(initialCustomer)),
      child: Scaffold(
        appBar: CustomAppBar.withTitleAndBackButton(
            title: initialCustomer != null ? 'Update Customer' : 'Add Customer'),
        body: SpacerColumnWithFixedSubmitColumn(
          hideKeyboard: true,
          submitButton: BlocBuilder<AddCustomerBloc, AddCustomerState>(
            builder: (context, state) {
              return HeroButton(
                onPressed: initialCustomer != null
                    ? context.read<AddCustomerBloc>().isChangeCustomerData(initialCustomer!)
                        ? () => context
                            .read<AddCustomerBloc>()
                            .add(AddCustomerEvent.updateCustomer(customerId: initialCustomer!.id!))
                        : null
                    : () =>
                        context.read<AddCustomerBloc>().add(const AddCustomerEvent.addCustomer()),
                title: initialCustomer != null ? 'Update' : 'Submit',
              );
            },
          ),
          children: [
            TitleAndDescriptionColumn(
              title: initialCustomer != null ? 'Update customer' : 'Add new customer',
              description: initialCustomer != null
                  ? 'You can update customer information in the form below'
                  : 'You can fill the below form to add a new customer',
            ),
            AddCustomerForm(initialCustomer: initialCustomer),
          ],
        ),
      ),
    );
  }
}

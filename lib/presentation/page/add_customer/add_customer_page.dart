import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hero_button/hero_button.dart';
import 'package:mc_crud_test/application/customer/add_customer/add_customer_bloc.dart';
import 'package:mc_crud_test/injection.dart';
import 'package:mc_crud_test/presentation/page/add_customer/widget/add_customer_form.dart';
import 'package:mc_crud_test/presentation/widget/app_bar/custom_app_bar.dart';
import 'package:mc_crud_test/presentation/widget/spacer_column_with_fixed_submit_button.dart';
import 'package:mc_crud_test/presentation/widget/title_and_description_column.dart';

class AddCustomerPage extends StatelessWidget {
  const AddCustomerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AddCustomerBloc>(),
      child: Scaffold(
        appBar: CustomAppBar.withTitleAndBackButton(title: 'Add Customer'),
        body: SpacerColumnWithFixedSubmitColumn(
          hideKeyboard: true,
          submitButton: BlocBuilder<AddCustomerBloc, AddCustomerState>(
            builder: (context, state) {
              return HeroButton(
                onPressed: () =>
                    context.read<AddCustomerBloc>().add(const AddCustomerEvent.addCustomer()),
                title: 'Submit',
              );
            },
          ),
          children: const [
            TitleAndDescriptionColumn(
              title: 'Add new customer',
              description: 'You can fill the below form to add a new customer',
            ),
            AddCustomerForm(),
          ],
        ),
      ),
    );
  }
}

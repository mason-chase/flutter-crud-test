import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mc_crud_test/application/customer/add_customer/add_customer_bloc.dart';
import 'package:mc_crud_test/application/customer/get_all_customer/get_all_customer_cubit.dart';
import 'package:mc_crud_test/domain/shared/enum/flush_bar_type_enum.dart';
import 'package:mc_crud_test/injection.dart';
import 'package:mc_crud_test/presentation/widget/flushybar.dart';

class AddUpdateCustomerListener extends StatelessWidget {
  final Widget child;

  const AddUpdateCustomerListener({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddCustomerBloc, AddCustomerState>(
      listenWhen: (p, c) =>
          p.addCustomerFailureOrSuccess != c.addCustomerFailureOrSuccess ||
          p.updateCustomerFailureOrSuccess != c.updateCustomerFailureOrSuccess,
      listener: (context, state) {
        state.addCustomerFailureOrSuccess.fold(
          () {},
          (data) => data.fold(
            (failure) => getIt<FlushyBar>().showFlushyBar(
              context: context,
              title: failure.errorMessage,
              flushBarType: FlushBarType.error,
            ),
            (success) {
              getIt<FlushyBar>().showFlushyBar(
                context: context,
                title: "Customer successfully added.",
                flushBarType: FlushBarType.success,
                onActionAfterDismiss: () {
                  context.read<GetAllCustomerCubit>().getAllCustomer();
                  context.pop();
                },
              );
            },
          ),
        );
        state.updateCustomerFailureOrSuccess.fold(
          () {},
          (data) => data.fold(
            (failure) => getIt<FlushyBar>().showFlushyBar(
              context: context,
              title: failure.errorMessage,
              flushBarType: FlushBarType.error,
            ),
            (success) {
              getIt<FlushyBar>().showFlushyBar(
                context: context,
                title: "Customer successfully updated.",
                flushBarType: FlushBarType.success,
                onActionAfterDismiss: () {
                  context.read<GetAllCustomerCubit>().getAllCustomer();
                  context.pop();
                },
              );
            },
          ),
        );
      },
      child: child,
    );
  }
}

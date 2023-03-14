import 'package:injectable/injectable.dart';

import '../../../../../core/bloc/base_cubit.dart';
import '../../../domain/entities/delete_customer/params/delete_customer_params.dart';
import '../../../domain/usecases/delete_customer.dart';
import 'state.dart';

@injectable
class DeleteCustomerCubit extends BaseCubit<DeleteCustomerState> {
  DeleteCustomerCubit({
    required this.deleteCustomer,
  }) : super(const DeleteCustomerState.initial());

  final DeleteCustomer deleteCustomer;

  Future<void> deleteCustomerF(DeleteCustomerParams params) async {
    emit(const DeleteCustomerState.loading());

    final result = await deleteCustomer(params);
    result.fold(
      (failure) => emit(DeleteCustomerState.error(failure)),
      (response) => emit(DeleteCustomerState.done(response)),
    );
  }
}

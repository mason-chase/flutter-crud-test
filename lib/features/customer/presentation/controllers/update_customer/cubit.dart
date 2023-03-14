import 'package:injectable/injectable.dart';

import '../../../../../core/bloc/base_cubit.dart';
import '../../../domain/entities/update_customer/params/update_customer_params.dart';
import '../../../domain/usecases/update_customer.dart';
import 'state.dart';

@injectable
class UpdateCustomerCubit extends BaseCubit<UpdateCustomerState> {
  UpdateCustomerCubit({
    required this.updateCustomer,
  }) : super(const UpdateCustomerState.initial());

  final UpdateCustomer updateCustomer;

  Future<void> updateCustomerF(UpdateCustomerParams params) async {
    emit(const UpdateCustomerState.loading());

    final result = await updateCustomer(params);
    result.fold(
      (failure) => emit(UpdateCustomerState.error(failure)),
      (response) => emit(UpdateCustomerState.done(response)),
    );
  }
}

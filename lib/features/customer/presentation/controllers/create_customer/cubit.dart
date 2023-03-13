import 'package:injectable/injectable.dart';

import '../../../../../core/bloc/base_cubit.dart';
import '../../../domain/entities/create_customer/params/create_customer_params.dart';
import '../../../domain/usecases/create_customer.dart';
import 'state.dart';

@injectable
class CreateCustomerCubit extends BaseCubit<CreateCustomerState> {
  CreateCustomerCubit({
    required this.createCustomer,
  }) : super(const CreateCustomerState.initial());

  final CreateCustomer createCustomer;

  Future<void> createCustomerF(CreateCustomerParams params) async {
    emit(const CreateCustomerState.loading());

    final result = await createCustomer(params);
    result.fold(
      (failure) => emit(CreateCustomerState.error(failure)),
      (response) => emit(CreateCustomerState.done(response)),
    );
  }
}

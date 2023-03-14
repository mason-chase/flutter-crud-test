import 'package:injectable/injectable.dart';

import '../../../../../core/bloc/base_cubit.dart';
import '../../../domain/entities/get_customers/params/get_customers_params.dart';
import '../../../domain/usecases/get_customers.dart';
import 'state.dart';

@injectable
class GetCustomersCubit extends BaseCubit<GetCustomersState> {
  GetCustomersCubit({
    required this.getCustomers,
  }) : super(const GetCustomersState.initial());

  final GetCustomers getCustomers;

  Future<void> getCustomersF(GetCustomersParams params) async {
    emit(const GetCustomersState.loading());

    final result = await getCustomers(params);
    result.fold(
      (failure) => emit(GetCustomersState.error(failure)),
      (response) => emit(GetCustomersState.done(response)),
    );
  }
}

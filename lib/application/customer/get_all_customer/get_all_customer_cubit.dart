import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:mc_crud_test/application/core/core_state.dart';
import 'package:mc_crud_test/domain/customer/entity/customer_entity.dart';
import 'package:mc_crud_test/domain/customer/i_customer_facade.dart';

@injectable
class GetAllCustomerCubit extends Cubit<CoreState<List<CustomerEntity>>> {
  final ICustomerFacade _customerFacade;

  GetAllCustomerCubit(this._customerFacade) : super(const CoreState.initial());

  Future<void> getAllCustomer() async {
    emit(const CoreState.loadInProgress());

    final res = await _customerFacade.getAllCustomer();

    emit(
      res.fold(
        (failure) => CoreState.fetchDataFailure(dataFailure: failure),
        (data) => CoreState.fetchDataSuccessfully(data: data),
      ),
    );
  }
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mc_crud_test/core/usecase/use_case.dart';
import 'package:mc_crud_test/features/customer_list/domain/usecase/customer_list_usecase.dart';
import 'package:mc_crud_test/features/customer_list/presentation/bloc/customer_list_bloc/customers_status.dart';
import 'package:meta/meta.dart';

import '../../../../../core/resources/data_state.dart';

part 'customers_event.dart';
part 'customers_state.dart';

class CustomerListBloc extends Bloc<CustomersEvent, CustomersState> {

  GetCustomerListUseCase getCustomerListUseCase;


  CustomerListBloc(this.getCustomerListUseCase) : super(CustomersState(getAllCustomersStatus: CustomersLoading())) {
    on<GetAllCustomersEvent>((event, emit) async {
      emit(state.copyWith(newListStatus: CustomersLoading()));

      DataState dataState = await getCustomerListUseCase(NoParams());

      if (dataState is DataSuccess) {
        emit(state.copyWith(
            newListStatus: GetAllCustomersCompleted(dataState.data)));
      }
      if (dataState is DataFailed) {
        emit(state.copyWith(
            newListStatus: GetAllCustomersError(dataState.error)));
      }
    });
  }

}

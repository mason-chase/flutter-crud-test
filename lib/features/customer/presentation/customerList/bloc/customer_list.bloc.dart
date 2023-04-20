import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mc_crud_test/features/customer/domain/usecases/get_customer_list.usecase.dart';
import 'package:mc_crud_test/features/customer/presentation/customerList/bloc/customer_list.event.dart';
import 'package:mc_crud_test/features/customer/presentation/customerList/bloc/customer_list.state.dart';

class CustomerListBloc extends Bloc<CustomerListEvent, CustomerListState> {
  final GetCustomerListUseCase getCustomerListUseCase;

  CustomerListBloc({required this.getCustomerListUseCase}) : super(Empty()) {
    on<GetCustomerList>(_mapGetCustomerListToState);
  }

  CustomerListState get initialState => Empty();

  _mapGetCustomerListToState(
      GetCustomerList event, Emitter<CustomerListState> emit) async {
    emit(Loading());
    var result = await getCustomerListUseCase.call();
    emit(result.fold(
      (failure) => Error(failure.message),
      (data) => ListLoaded(data),
    ));
  }
}

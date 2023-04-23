
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mc_crud_test/features/customer/domain/usecases/delete_customer.usecase.dart';
import 'package:mc_crud_test/features/customer/domain/usecases/get_customer_list.usecase.dart';
import 'package:mc_crud_test/features/customer/presentation/customerList/bloc/customer_list.event.dart';
import 'package:mc_crud_test/features/customer/presentation/customerList/bloc/customer_list.state.dart';

class CustomerListBloc extends Bloc<CustomerListEvent, CustomerListState> {
  final GetCustomerListUseCase getCustomerListUseCase;
  final DeleteCustomerUseCase deleteCustomerUseCase;

  CustomerListBloc(
      {required this.getCustomerListUseCase,
      required this.deleteCustomerUseCase})
      : super(Empty()) {
    on<GetCustomerList>(_mapGetCustomerListToState);
    on<DeleteCustomer>(_mapDeleteCustomerToState);
  }

  CustomerListState get initialState => Empty();

  _mapGetCustomerListToState(
      GetCustomerList event, Emitter<CustomerListState> emit) async {
    emit(Loading());
    var result = await getCustomerListUseCase.call();
    emit(result.fold(
      (failure) => Error(failure.message),
      (data) => data.isNotEmpty ? ListLoaded(data) : Empty(),
    ));
  }

  _mapDeleteCustomerToState(
      DeleteCustomer event, Emitter<CustomerListState> emit) async {

    var result = await deleteCustomerUseCase.call(event.customer);
    if (result.isRight()) {
      emit(Deleted());
      add(GetCustomerList());
    } else if (result.isLeft()) {
      emit(Error(result.fold((l) => l.message, (r) => '')));
    }
  }
}

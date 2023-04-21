import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mc_crud_test/features/customer/domain/usecases/add_customer.usecase.dart';
import 'package:mc_crud_test/features/customer/presentation/addCustomer/bloc/add_customer.event.dart';
import 'package:mc_crud_test/features/customer/presentation/addCustomer/bloc/add_customer.state.dart';

class AddCustomerBloc extends Bloc<AddCustomerEvent, AddCustomerState> {
  final AddCustomerUseCase addCustomerUseCase;

  AddCustomerBloc({
    required this.addCustomerUseCase,
  }) : super(AddCustomerInitial()) {
    on<AddNewCustomer>(_mapAddCustomerToState);
  }

  _mapAddCustomerToState(
      AddNewCustomer event, Emitter<AddCustomerState> emit) async {
    emit(AddCustomerLoading());
    // var result = await addCustomerUseCase.call(event.customer);
    // emit(result.fold(
    //   (failure) => AddCustomerError(failure.message),
    //   (data) => CustomerAdded(),
    // ));
  }
}

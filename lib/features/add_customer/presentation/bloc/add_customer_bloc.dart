import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mc_crud_test/core/data/data_source/local/customer_entity.dart';
import 'package:mc_crud_test/features/add_customer/domain/usecase/add_customer_usecase.dart';
import 'package:mc_crud_test/features/add_customer/presentation/bloc/add_customer_status.dart';
import 'package:meta/meta.dart';

import '../../../../core/resources/data_state.dart';

part 'add_customer_event.dart';
part 'add_customer_state.dart';

class AddCustomerBloc extends Bloc<AddCustomerEvent, AddCustomerState> {

  AddCustomerUseCase addCustomerUseCase;
  AddCustomerBloc(this.addCustomerUseCase) : super(AddCustomerState(addCustomerStatus: AddCustomerInitial())) {
    on<NewCustomerEvent>((event, emit) async {
      emit(state.copyWith(newCustomerStatus: AddCustomerLoading()));
      DataState dataState =
          await addCustomerUseCase(event.customerEntity);

      if (dataState is DataSuccess) {
        emit(state.copyWith(
            newCustomerStatus: AddCustomerCompleted(dataState.data)));
      }
      if (dataState is DataFailed) {
        emit(state.copyWith(
            newCustomerStatus: AddCustomerError(dataState.error)));
      }
    });



  }
}

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:logger/logger.dart';
import 'package:mc_crud_test/features/delete_customer/domain/usecase/delete_customer_usecase.dart';
import 'package:mc_crud_test/features/delete_customer/presentation/bloc/delete_customer_status.dart';
import 'package:meta/meta.dart';

import '../../../../core/resources/data_state.dart';

part 'delete_customer_event.dart';
part 'delete_customer_state.dart';

class DeleteCustomerBloc extends Bloc<DeleteCustomerEvent, DeleteCustomerState> {

  DeleteCustomerUseCase deleteCustomerUseCase;

  Logger logger = Logger(printer: PrettyPrinter());

  DeleteCustomerBloc(this.deleteCustomerUseCase) : super(DeleteCustomerState(deleteCustomerStatus: DeleteCustomerLoading())) {
    on<DeleteCustomerEvent>((event, emit) async {
      emit(state.copyWith(newDeleteCustomerStatus: DeleteCustomerLoading()));


      DataState dataState =
          await deleteCustomerUseCase(event.customerId);

      if (dataState is DataSuccess) {
        logger.d(dataState);
        emit(state.copyWith(
            newDeleteCustomerStatus: DeleteCustomerCompleted(dataState.data)));
      }
      if (dataState is DataFailed) {
        emit(state.copyWith(
            newDeleteCustomerStatus: DeleteCustomerError(dataState.error)));
      }
    });
  }
}

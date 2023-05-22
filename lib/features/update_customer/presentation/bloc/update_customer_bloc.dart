import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:logger/logger.dart';
import 'package:mc_crud_test/core/data/data_source/local/customer_entity.dart';
import 'package:mc_crud_test/features/update_customer/domain/usecase/update_customer_usecase.dart';
import 'package:mc_crud_test/features/update_customer/presentation/bloc/update_customer_status.dart';
import 'package:meta/meta.dart';

import '../../../../core/resources/data_state.dart';

part 'update_customer_event.dart';

part 'update_customer_state.dart';

class UpdateCustomerBloc
    extends Bloc<UpdateCustomerEvent, UpdateCustomerState> {
  UpdateCustomerUseCase updateCustomerUseCase;

  Logger logger = Logger(printer: PrettyPrinter());

  UpdateCustomerBloc(this.updateCustomerUseCase)
      : super(UpdateCustomerState(
            updateCustomerStatus: UpdateCustomerLoading())) {
    on<UpdateCustomerEvent>((event, emit) async {
      emit(state.copyWith(newUpdateCustomerStatus: UpdateCustomerLoading()));

      DataState dataState = await updateCustomerUseCase(event.customer);

      if (dataState is DataSuccess) {
        logger.d(dataState);
        emit(state.copyWith(
            newUpdateCustomerStatus: UpdateCustomerCompleted(dataState.data)));
      }
      if (dataState is DataFailed) {
        emit(state.copyWith(
            newUpdateCustomerStatus: UpdateCustomerError(dataState.error)));
      }
    });
  }

}

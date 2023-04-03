import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mc_crud_test/core/customer/data/datasource/customer_local_datasource.dart';
import 'package:mc_crud_test/core/customer/data/dto/customer_dto.dart';
import 'package:mc_crud_test/core/customer/data/mapper/customers_mapper.dart';
import 'package:mc_crud_test/core/customer/domain/entity/customer_entity.dart';
import 'package:mc_crud_test/core/customer/domain/usecase/customer/add_customer_usecase.dart';
import 'package:mc_crud_test/core/customer/domain/usecase/customer/delete_customer_usecase.dart';
import 'package:mc_crud_test/core/customer/domain/usecase/customer/get_customer_list_usecase.dart';
import 'package:mc_crud_test/core/customer/domain/usecase/customer/update_customer_usecase.dart';

part 'customer_event.dart';
part 'customer_state.dart';

class CustomerBloc extends Bloc<CustomerEvent, CustomerState> {
  CustomerBloc({
    required this.getAllCustomersUseCase,
    required this.addCustomerUseCase,
    required this.updateCustomerUseCase,
    required this.deleteCustomerUseCase,
    this.customerMapper,
  }) : super(const CustomerState()) {
    on<AddCustomer>(_mapAddCustomerEventToState);
    on<GetCustomers>(_mapGetCustomersEventToState);
    on<SelectCustomer>(_mapSelectCustomerEventToState);
    on<UpdateCustomerEvent>(_mapUpdateCustomerEventToState);
    on<DeleteCustomer>(_mapDeleteCustomerEventToState);
  }
  AddCustomerImpl addCustomerUseCase;
  GetAllCustomersImpl getAllCustomersUseCase;
  UpdateCustomerImpl updateCustomerUseCase;
  DeleteCustomerImpl deleteCustomerUseCase;
  late final CustomerMapper? customerMapper;

  void _mapAddCustomerEventToState(
      AddCustomer event, Emitter<CustomerState> emit) async {
    emit(state.copyWith(status: CustomerStatus.loading));
    try {
      addCustomerUseCase.customerData = event.customerData;
      var customers = await addCustomerUseCase.execute();
      emit(
        state.copyWith(status: CustomerStatus.success),
      );
    } catch (error, stacktrace) {
      if (kDebugMode) {
        print(stacktrace);
      }
      emit(state.copyWith(status: CustomerStatus.error));
    }
  }

  void _mapGetCustomersEventToState(
      GetCustomers event, Emitter<CustomerState> emit) async {
    emit(state.copyWith(status: CustomerStatus.loading));
    try {
      var customers = await customerMapper?.getAllCustomers();
      emit(
        state.copyWith(
          status: CustomerStatus.success,
          customers: customers?.getOrElse(() => []),
        ),
      );
    } catch (error, stacktrace) {
      if (kDebugMode) {
        print(stacktrace);
      }
      emit(state.copyWith(status: CustomerStatus.error));
    }
  }

  void _mapSelectCustomerEventToState(
      SelectCustomer event, Emitter<CustomerState> emit) async {
    emit(
      state.copyWith(
        status: CustomerStatus.selected,
        selectedCustomerIndex: event.selectedCustomerIndex,
      ),
    );
  }

  void _mapUpdateCustomerEventToState(
    UpdateCustomerEvent event,
    Emitter<CustomerState> emit,
  ) async {
    updateCustomerUseCase.customerData = event.customerData;
    updateCustomerUseCase.index = event.selectedCustomerIndex;
    emit(state.copyWith(status: CustomerStatus.loading));
    try {
      await updateCustomerUseCase.execute();
      emit(
        state.copyWith(status: CustomerStatus.success),
      );
    } catch (error, stacktrace) {
      if (kDebugMode) {
        print(stacktrace);
      }
      emit(state.copyWith(status: CustomerStatus.error));
    }
  }

  void _mapDeleteCustomerEventToState(
      DeleteCustomer event, Emitter<CustomerState> emit) async {
    emit(
      state.copyWith(
        status: CustomerStatus.selected,
        selectedCustomerIndex: event.selectedCustomerIndex,
      ),
    );
  }
}

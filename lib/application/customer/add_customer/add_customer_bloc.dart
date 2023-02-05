import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:mc_crud_test/domain/customer/entity/customer_entity.dart';
import 'package:mc_crud_test/domain/customer/i_customer_facade.dart';
import 'package:dartz/dartz.dart';
import 'package:mc_crud_test/domain/core/failure/core_failure.dart';
import 'package:mc_crud_test/domain/core/value_objects.dart';

part 'add_customer_bloc.freezed.dart';

part 'add_customer_event.dart';

part 'add_customer_state.dart';

@injectable
class AddCustomerBloc extends Bloc<AddCustomerEvent, AddCustomerState> {
  final ICustomerFacade _customerFacade;

  AddCustomerBloc(this._customerFacade) : super(AddCustomerState.initial()) {
    on<_AddCustomerEventInitialCustomer>(_onInitialCustomer);
    on<_AddCustomerEventFirstNameChanged>(_onFirstNameChanged);
    on<_AddCustomerEventLastNameChanged>(_onLastNameChanged);
    on<_AddCustomerEventDateOfBirthChanged>(_onDateOfBirthChanged);
    on<_AddCustomerEventPhoneNumberChanged>(_onPhoneNumberChanged);
    on<_AddCustomerEventEmailChanged>(_onEmailChanged);
    on<_AddCustomerEventBankAccountNumberChanged>(_onBankAccountNumberChanged);
    on<_AddCustomer>(_onAddCustomer);
    on<_UpdateCustomer>(_onUpdateCustomer);
  }

  void _onInitialCustomer(_AddCustomerEventInitialCustomer event, Emitter<AddCustomerState> emit) {}

  void _onFirstNameChanged(
      _AddCustomerEventFirstNameChanged event, Emitter<AddCustomerState> emit) {}

  void _onLastNameChanged(_AddCustomerEventLastNameChanged event, Emitter<AddCustomerState> emit) {}

  void _onDateOfBirthChanged(
      _AddCustomerEventDateOfBirthChanged event, Emitter<AddCustomerState> emit) {}

  void _onPhoneNumberChanged(
      _AddCustomerEventPhoneNumberChanged event, Emitter<AddCustomerState> emit) {}

  void _onEmailChanged(_AddCustomerEventEmailChanged event, Emitter<AddCustomerState> emit) {}

  void _onBankAccountNumberChanged(
      _AddCustomerEventBankAccountNumberChanged event, Emitter<AddCustomerState> emit) {}

  void _onAddCustomer(_AddCustomer event, Emitter<AddCustomerState> emit) {}

  void _onUpdateCustomer(_UpdateCustomer event, Emitter<AddCustomerState> emit) {}
}

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
          _AddCustomerEventFirstNameChanged event, Emitter<AddCustomerState> emit) =>
      emit(
        state.copyWith(
          firstName: MandatoryValue(event.firstName),
          addCustomerFailureOrSuccess: none(),
        ),
      );

  void _onLastNameChanged(_AddCustomerEventLastNameChanged event, Emitter<AddCustomerState> emit) =>
      emit(
        state.copyWith(
          lastName: MandatoryValue(event.lastName),
          addCustomerFailureOrSuccess: none(),
        ),
      );

  void _onDateOfBirthChanged(
      _AddCustomerEventDateOfBirthChanged event, Emitter<AddCustomerState> emit) {
    final strDateOfBirth =
        '${event.dateOfBirth.year}-${event.dateOfBirth.month}-${event.dateOfBirth.day}';
    emit(
      state.copyWith(
        dateOfBirth: MandatoryValue(strDateOfBirth),
        addCustomerFailureOrSuccess: none(),
      ),
    );
  }

  void _onPhoneNumberChanged(
          _AddCustomerEventPhoneNumberChanged event, Emitter<AddCustomerState> emit) =>
      emit(
        state.copyWith(
          phoneNumber: PhoneNumber(event.phoneNumber),
          addCustomerFailureOrSuccess: none(),
        ),
      );

  void _onEmailChanged(_AddCustomerEventEmailChanged event, Emitter<AddCustomerState> emit) => emit(
        state.copyWith(
          email: Email(event.email),
          addCustomerFailureOrSuccess: none(),
        ),
      );

  void _onBankAccountNumberChanged(
          _AddCustomerEventBankAccountNumberChanged event, Emitter<AddCustomerState> emit) =>
      emit(
        state.copyWith(
          bankAccountNumber: BankAccountNumber(event.bankAccountNumber),
          addCustomerFailureOrSuccess: none(),
        ),
      );

  void _onAddCustomer(_AddCustomer event, Emitter<AddCustomerState> emit) async {
    Either<CoreFailure, Unit>? failureOrSuccess;

    if (isValidState()) {
      emit(
        state.copyWith(
          isSubmitting: true,
          addCustomerFailureOrSuccess: none(),
        ),
      );

      failureOrSuccess = await _customerFacade.addCustomer(state);
    }

    emit(
      state.copyWith(
        isSubmitting: false,
        showErrorMessages: true,
        addCustomerFailureOrSuccess: optionOf<Either<CoreFailure, Unit>>(failureOrSuccess),
      ),
    );
  }

  void _onUpdateCustomer(_UpdateCustomer event, Emitter<AddCustomerState> emit) {}

  bool isValidState() =>
      state.firstName.isValid() &&
      state.lastName.isValid() &&
      state.dateOfBirth.isValid() &&
      state.phoneNumber.isValid() &&
      state.email.isValid() &&
      state.bankAccountNumber.isValid();
}

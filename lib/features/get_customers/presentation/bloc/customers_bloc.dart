import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mc_crud_test/features/get_customers/presentation/bloc/customers_status.dart';
import 'package:meta/meta.dart';

part 'customers_event.dart';
part 'customers_state.dart';

class CustomersBloc extends Bloc<CustomersEvent, CustomersState> {
  CustomersBloc() : super(CustomersInitial()) {
    on<CustomersEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

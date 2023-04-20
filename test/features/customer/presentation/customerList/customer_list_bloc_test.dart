import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mc_crud_test/features/customer/domain/usecases/get_customer_list.usecase.dart';
import 'package:mc_crud_test/features/customer/presentation/customerList/bloc/customer_list.bloc.dart';
import 'package:mc_crud_test/features/customer/presentation/customerList/bloc/customer_list.event.dart';
import 'package:mc_crud_test/features/customer/presentation/customerList/bloc/customer_list.state.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import '../../customer_test.constants.dart';
import 'customer_list_bloc_test.mocks.dart';

@GenerateMocks([GetCustomerListUseCase])
void main() {
  CustomerListBloc bloc =
      CustomerListBloc(getCustomerListUseCase: MockGetCustomerListUseCase());

  test('initial state is Empty', () {
    expect(bloc.state, equals(Empty()));
  });

  group("Load Customers", ()
  {
    test(
        "should emit [Loading, Loaded] when data is gotten successfully", () async {
      // arrange
      when(bloc.getCustomerListUseCase.call())
          .thenAnswer((_) async => const Right(tCustomerList));

      // assert later
      final expected = [
        Loading(),
        ListLoaded(tCustomerList),
      ];
      expectLater(bloc.stream, emitsInOrder(expected));
      bloc.add(GetCustomerList());


    });


    test("should emit [Loading, Error] when getting data fails", () async {
      // arrange
      when(bloc.getCustomerListUseCase.call())
          .thenAnswer((_) async => const Left(tFailure));

      // assert later
      final expected = [
        Loading(),
        Error(tFailure.message),
      ];
      expectLater(bloc.stream, emitsInOrder(expected));
      bloc.add(GetCustomerList());
    });
  });
}

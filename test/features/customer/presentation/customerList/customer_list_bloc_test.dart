import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mc_crud_test/features/customer/domain/usecases/delete_customer.usecase.dart';
import 'package:mc_crud_test/features/customer/domain/usecases/get_customer_list.usecase.dart';
import 'package:mc_crud_test/features/customer/presentation/customerList/bloc/customer_list.bloc.dart';
import 'package:mc_crud_test/features/customer/presentation/customerList/bloc/customer_list.event.dart';
import 'package:mc_crud_test/features/customer/presentation/customerList/bloc/customer_list.state.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../customer_test.constants.dart';
import 'customer_list_bloc_test.mocks.dart';

@GenerateMocks([GetCustomerListUseCase])
@GenerateMocks([DeleteCustomerUseCase])
void main() {
  CustomerListBloc bloc = CustomerListBloc(
      getCustomerListUseCase: MockGetCustomerListUseCase(),
      deleteCustomerUseCase: MockDeleteCustomerUseCase());

  test('initial state is Empty', () {
    expect(bloc.state, equals(Empty()));
  });

  group("Load Customers", () {
    test("should emit [Loading, Loaded] when data is gotten successfully",
        () async {
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

  group("Delete Customer", () {
    test("should emit data is deleted successfully",
        () async {
      // arrange
      when(bloc.deleteCustomerUseCase.call(tCustomer))
          .thenAnswer((_) async => const Right(unit));
      // assert later
      var result = await bloc.deleteCustomerUseCase.call(tCustomer);
      expect(result, const Right(unit));
    });

    test("should emit [Loading, Error] when fail to delete customer", () async {
      // arrange
      when(bloc.deleteCustomerUseCase.call(tCustomer))
          .thenAnswer((_) async => const Left(tFailure));

      // assert later
      final expected = [
        Loading(),
        Error(tFailure.message),
      ];

      expectLater(bloc.stream, emitsInOrder(expected));
      bloc.add(DeleteCustomer(tCustomer));
    });
  });
}

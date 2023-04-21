import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mc_crud_test/features/customer/domain/usecases/add_customer.usecase.dart';
import 'package:mc_crud_test/features/customer/presentation/addCustomer/bloc/add_customer.bloc.dart';
import 'package:mc_crud_test/features/customer/presentation/addCustomer/bloc/add_customer.event.dart';
import 'package:mc_crud_test/features/customer/presentation/addCustomer/bloc/add_customer.state.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../customer_test.constants.dart';
import 'add_customer.bloc_test.mocks.dart';

@GenerateMocks([AddCustomerUseCase])
void main() {
  AddCustomerBloc bloc =
  AddCustomerBloc(addCustomerUseCase: MockAddCustomerUseCase());

  test('initial state is Empty', () {
    expect(bloc.state, equals(AddCustomerInitial()));
  });

  group("add customer", () {

    test("should get data from useCase" , () async {
      // arrange
      when(bloc.addCustomerUseCase.call(tCustomer))
          .thenAnswer((_) async => const Right(tCustomer));

      // act
      bloc.add(AddNewCustomer(tCustomer));

      await untilCalled(bloc.addCustomerUseCase.call(tCustomer));

      // assert
      verify(bloc.addCustomerUseCase.call(tCustomer));
    });

    test("should emit [AddCustomerLoading, CustomerAdded] when all data are valid", () async {
      // arrange
      when(bloc.addCustomerUseCase.call(tCustomer))
          .thenAnswer((_) async => const Right(tCustomer));

      // assert later
      final expected = [
        AddCustomerLoading(),
        CustomerAdded(),
      ];
      expectLater(bloc.stream, emitsInOrder(expected));
      bloc.add(AddNewCustomer(tCustomer));
    });

    test("should emit [AddCustomerLoading, AddCustomerError] when user already exist", () async {
      // arrange
      when(bloc.addCustomerUseCase.call(tCustomer))
          .thenAnswer((_) async => const Left(tFailureAllReadyExist));

      // assert later
      final expected = [
        AddCustomerLoading(),
        AddCustomerError(tFailureAllReadyExist.message),
      ];
      expectLater(bloc.stream, emitsInOrder(expected));
      bloc.add(AddNewCustomer(tCustomer));
    });


    test("should emit [AddCustomerLoading, AddCustomerError] when getting data fails", () async {
      // arrange
      when(bloc.addCustomerUseCase.call(tCustomer))
          .thenAnswer((_) async => const Left(tFailure));

      // assert later
      final expected = [
        AddCustomerLoading(),
        AddCustomerError(tFailure.message),
      ];
      expectLater(bloc.stream, emitsInOrder(expected));
      bloc.add(AddNewCustomer(tCustomer));


    });
  });


}
// Mocks generated by Mockito 5.4.0 from annotations
// in mc_crud_test/test/features/customer/domain/get_customer_list_usecases_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:mc_crud_test/core/models/failure.dart' as _i5;
import 'package:mc_crud_test/features/customer/domain/customer.entity.dart'
    as _i6;
import 'package:mc_crud_test/features/customer/domain/customer.respository.dart'
    as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [CustomerRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockCustomerRepository extends _i1.Mock
    implements _i3.CustomerRepository {
  MockCustomerRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i6.Customer>>> getCustomerList() =>
      (super.noSuchMethod(
        Invocation.method(
          #getCustomerList,
          [],
        ),
        returnValue:
            _i4.Future<_i2.Either<_i5.Failure, List<_i6.Customer>>>.value(
                _FakeEither_0<_i5.Failure, List<_i6.Customer>>(
          this,
          Invocation.method(
            #getCustomerList,
            [],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, List<_i6.Customer>>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, void>> addCustomer(
          _i6.Customer? customer) =>
      (super.noSuchMethod(
        Invocation.method(
          #addCustomer,
          [customer],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, void>>.value(
            _FakeEither_0<_i5.Failure, void>(
          this,
          Invocation.method(
            #addCustomer,
            [customer],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, void>>);
}

// Mocks generated by Mockito 5.3.2 from annotations
// in mc_crud_test/features/customer/data/datasources/customer_local_data_source.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:mc_crud_test/features/customer/data/datasources/customer_local_data_source.dart'
    as _i3;
import 'package:mc_crud_test/features/customer/domain/entities/customer.dart'
    as _i2;
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

class _FakeCustomer_0 extends _i1.SmartFake implements _i2.Customer {
  _FakeCustomer_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [CustomerLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockCustomerLocalDataSource extends _i1.Mock
    implements _i3.CustomerLocalDataSource {
  @override
  _i4.Future<List<_i2.Customer>> getCustomers() => (super.noSuchMethod(
        Invocation.method(
          #getCustomers,
          [],
        ),
        returnValue: _i4.Future<List<_i2.Customer>>.value(<_i2.Customer>[]),
        returnValueForMissingStub:
            _i4.Future<List<_i2.Customer>>.value(<_i2.Customer>[]),
      ) as _i4.Future<List<_i2.Customer>>);
  @override
  _i4.Future<_i2.Customer?> getCustomerById(String? id) => (super.noSuchMethod(
        Invocation.method(
          #getCustomerById,
          [id],
        ),
        returnValue: _i4.Future<_i2.Customer?>.value(),
        returnValueForMissingStub: _i4.Future<_i2.Customer?>.value(),
      ) as _i4.Future<_i2.Customer?>);
  @override
  _i4.Future<_i2.Customer> addCustomer(_i2.Customer? customer) =>
      (super.noSuchMethod(
        Invocation.method(
          #addCustomer,
          [customer],
        ),
        returnValue: _i4.Future<_i2.Customer>.value(_FakeCustomer_0(
          this,
          Invocation.method(
            #addCustomer,
            [customer],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Customer>.value(_FakeCustomer_0(
          this,
          Invocation.method(
            #addCustomer,
            [customer],
          ),
        )),
      ) as _i4.Future<_i2.Customer>);
  @override
  _i4.Future<_i2.Customer> editCustomer(_i2.Customer? customer) =>
      (super.noSuchMethod(
        Invocation.method(
          #editCustomer,
          [customer],
        ),
        returnValue: _i4.Future<_i2.Customer>.value(_FakeCustomer_0(
          this,
          Invocation.method(
            #editCustomer,
            [customer],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Customer>.value(_FakeCustomer_0(
          this,
          Invocation.method(
            #editCustomer,
            [customer],
          ),
        )),
      ) as _i4.Future<_i2.Customer>);
  @override
  _i4.Future<void> deleteCustomer(String? email) => (super.noSuchMethod(
        Invocation.method(
          #deleteCustomer,
          [email],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
}

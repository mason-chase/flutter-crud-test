import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mc_crud_test/core/customer/data/dto/customer_dto.dart';
import 'package:mc_crud_test/core/customer/data/keys/shared_keys.dart';
import 'package:mc_crud_test/core/error/failures.dart';
import 'package:mc_crud_test/feature/customer/page/customer_add_page.dart';
import 'package:secure_shared_preferences/secure_shared_pref.dart';

enum CustomerAddedStatus {
  added,
  exists,
  error,
}

enum CustomerUpdatedStatus {
  updated,
  error,
}

enum CustomerDeletedStatus {
  deleted,
  error,
}

class CustomerLocalDataSource {
  CustomerLocalDataSource();
  final SharedPrefKeys _sharedPrefKeys = SharedPrefKeys();
  late final Box box;

  Future<Either<Failure, CustomerDTO>> getCustomerDetails(
      String firstName) async {
    throw UnimplementedError();
  }

  Future<Either<Failure, List<CustomerDTO>>> getCustomerList() async {
    late final Box box;
    box = Hive.box('customerBox');
    List<CustomerDTO> customersObject = [];

    try {
      Map<dynamic, dynamic> customers = box.toMap();
      customers.values.forEach((_) {
        customersObject.add(_);
      });

      return Right(customersObject);
    } catch (e) {
      return const Right([]);
    }
  }

  Future<Either<Failure, CustomerAddedStatus>> addCustomer(
      CustomerDTO customer) async {
    late final Box box;
    box = Hive.box('customerBox');
    Iterable<dynamic> reoccurCustomList = [];

    try {
      Map<dynamic, dynamic> customers = box.toMap();

      if (customers.isNotEmpty) {
        reoccurCustomList = box.toMap().values.where(
          (element) {
            return element.firstName == customer.firstName ||
                element.lastName == customer.lastName ||
                element.email == customer.email ||
                element.bankAcountNumber == customer.bankAcountNumber;
          },
        );
      }
      if (reoccurCustomList.isEmpty || customers.isEmpty) {
        await box.add(customer);
        return const Right(CustomerAddedStatus.added);
      } else {
        return const Right(CustomerAddedStatus.exists);
      }
    } catch (e) {
      return const Right(CustomerAddedStatus.error);
    }
  }

  Future<Either<Failure, CustomerUpdatedStatus>> updateCustomer(
      {required CustomerDTO oldCustomer,
      required CustomerDTO customer,
      required int index}) async {
    late final Box box;
    box = Hive.box('customerBox');

    try {
      Iterable<dynamic> reoccurCustomList = [];

      box.deleteAt(index);

      reoccurCustomList = box.toMap().values.where(
        (element) {
          return element.firstName == customer.firstName ||
              element.lastName == customer.lastName ||
              element.email == customer.email ||
              element.bankAcountNumber == customer.bankAcountNumber;
        },
      );
      if (reoccurCustomList.isNotEmpty) {
        box.add(CustomerDTO(
            firstName: oldCustomerData?.firstName,
            lastName: oldCustomerData?.lastName,
            dateOfBirth: oldCustomerData?.dateOfBirth,
            phoneNumber: oldCustomerData?.phoneNumber,
            email: oldCustomerData?.email,
            bankAcountNumber: oldCustomerData?.bankAcountNumber));
        return const Right(CustomerUpdatedStatus.error);
      } else {
        box.add(customer);
        //box.putAt(index, customer);
        return const Right(CustomerUpdatedStatus.updated);
      }
    } catch (e) {
      return const Right(CustomerUpdatedStatus.error);
    }
  }

  Future<Either<Failure, CustomerDeletedStatus>> deleteCustomer(
      {required int index}) async {
    late final Box box;
    box = Hive.box('customerBox');

    try {
      box.deleteAt(index);

      return const Right(CustomerDeletedStatus.deleted);
    } catch (e) {
      return const Right(CustomerDeletedStatus.error);
    }
  }
}

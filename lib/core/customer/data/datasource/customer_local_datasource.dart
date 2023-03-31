import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mc_crud_test/core/customer/data/dto/customer_dto.dart';
import 'package:mc_crud_test/core/customer/data/keys/shared_keys.dart';
import 'package:mc_crud_test/core/error/failures.dart';
import 'package:secure_shared_preferences/secure_shared_pref.dart';

class CustomerLocalDataSource {
  CustomerLocalDataSource();
  final SharedPrefKeys _sharedPrefKeys = SharedPrefKeys();
  late final Box box;

  Future<Either<Failure, CustomerDTO>> getCustomerDetails(
      String firstName) async {
    throw UnimplementedError();
  }

  Future<Either<Failure, List<CustomerDTO>>> getCustomerList() async {
    var pref = await SecureSharedPref.getInstance();

    try {
      List<String> customers =
          await pref.getStringList(_sharedPrefKeys.customers);

      List<CustomerDTO> customersObject = [];

      customers.forEach(
          (_) => customersObject.add(CustomerDTO.fromJson(jsonDecode(_))));

      return Right(customersObject);
    } catch (e) {
      return const Right([]);
    }
  }

  // Future<Either<Failure, String>> addCustomer(CustomerDTO customer) async {
  //   var pref = await SecureSharedPref.getInstance();

  //   try {
  //     List<String> customers =
  //         await pref.getStringList(_sharedPrefKeys.customers);

  //     Iterable<String> reoccurCustomList = [];

  //     if (customers.isNotEmpty) {
  //       reoccurCustomList = customers.where((element) {
  //         Map<String, dynamic> customerObject = jsonDecode(element);
  //         CustomerDTO customerObj = CustomerDTO.fromJson(customerObject);

  //         return customerObj.firstName == customer.firstName ||
  //             customerObj.lastName == customer.lastName ||
  //             customerObj.email == customer.email ||
  //             customerObj.dateOfBirth == customer.dateOfBirth;
  //       });
  //     }

  //     if (reoccurCustomList.isEmpty || customers.isEmpty) {
  //       customers.add(customer.toJson().toString());
  //       await pref.putStringList(_sharedPrefKeys.customers, customers);
  //       return const Right("Customer added");
  //     } else {
  //       return const Right("Exist in database");
  //     }
  //   } catch (e) {
  //     return const Right("Error in adding customer!");
  //   }
  // }
  Future<Either<Failure, String>> addCustomer(CustomerDTO customer) async {
    var pref = await SecureSharedPref.getInstance();

    try {
      List<String> customers =
          await pref.getStringList(_sharedPrefKeys.customers);

      Iterable<String> reoccurCustomList = [];

      if (customers.isNotEmpty) {
        reoccurCustomList = customers.where((element) {
          Map<String, dynamic> customerObject = jsonDecode(element);
          CustomerDTO customerObj = CustomerDTO.fromJson(customerObject);

          return customerObj.firstName == customer.firstName ||
              customerObj.lastName == customer.lastName ||
              customerObj.email == customer.email ||
              customerObj.dateOfBirth == customer.dateOfBirth;
        });
      }

      if (reoccurCustomList.isEmpty || customers.isEmpty) {
        customers.add(customer.toJson().toString());
        await pref.putStringList(_sharedPrefKeys.customers, customers);
        return const Right("Customer added");
      } else {
        return const Right("Exist in database");
      }
    } catch (e) {
      return const Right("Error in adding customer!");
    }
  }

  Future<Either<Failure, String>> updateCustomer(CustomerDTO customer) async {
    var pref = await SecureSharedPref.getInstance();

    try {
      List<String> customers =
          await pref.getStringList(_sharedPrefKeys.customers);

      String foundCustomer;
      foundCustomer = customers.firstWhere(
        (element) {
          Map<String, dynamic> customerObject = jsonDecode(element);
          CustomerDTO customerObj = CustomerDTO.fromJson(customerObject);

          return customerObj.firstName == customer.firstName;
        },
      );

      if (foundCustomer.isNotEmpty && foundCustomer.length > 1) {
        Map<String, dynamic> foundCustomerObj = jsonDecode(foundCustomer);

        foundCustomerObj = customer.toJson() ?? {
              "firstName": "testFirstName1",
              "lastName": "testLastName1",
              "dateOfBirth": "010101",
              "phoneNumber": "1234567890",
              "email": "test@email.com",
              "bankAcountNumber": "1234567890"
            };

        

        return Right("Updated");
      } else {
        return Right("Customer not found!");
      }
    } catch (e) {
      return const Right("Customer not updated!");
    }
  }

  Future<Either<Failure, String>> deleteCustomer() async {
    throw UnimplementedError();
  }
}

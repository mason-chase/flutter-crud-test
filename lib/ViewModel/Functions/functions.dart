import 'package:amir_crud_test/Model/DataBase/hive_database.dart';
import 'package:amir_crud_test/Model/Description/description.dart';
import 'package:credit_card_validator/credit_card_validator.dart';
import 'package:email_validator/email_validator.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';


class Functions {
  String boxName = "AmirBox";

  Future<void> openBox() async {
    final bool isBoxOpen = Hive.isBoxOpen(boxName);
    if (!isBoxOpen) {
      await Hive.openBox<Database>(boxName);
    }
  }

  Future<void> closeDatabase() async {
    await Hive.close();
  }

  Future<List<Database>> getDatabase() async {
    await openBox();
    final box = Hive.box<Database>(boxName);
    final List<Database> database = [];
    for (var element in box.values.toList()) {
      database.add(element);
    }
    return database;
  }

  Future<Description> validateion(
      {required String phoneNumber,
      required String email,
      required String bankNumber}) async {
    final bool isValidEmail = EmailValidator.validate(email, true, true);
    final bool isValidNumber = phoneNumber.isPhoneNumber;
    final bool isValidCredit =
        CreditCardValidator().validateCCNum(bankNumber).isValid;
    switch (isValidCredit && isValidNumber && isValidEmail) {
      case true:
        return Description(isValid: true, description: "Success");
      case false:
        if (!isValidEmail) {
          return Description(
              isValid: false, description: "Please enter valid email");
        } else if (!isValidNumber) {
          return Description(
              isValid: false, description: "Please enter valid phone number");
        } else if (!isValidCredit) {
          return Description(
              isValid: false, description: "Please enter valid Bank Number");
        }
    }
    return Description(isValid: false, description: "Unsuccess");
  }

  Future<Description> addToBox({required Database database}) async {
    final String bankNumber = database.bankAccountNumber;
    final String phoneNumber = database.phoneNumber;
    final String email = database.email;
    final firstDescription = await validateion(
        phoneNumber: phoneNumber, email: email, bankNumber: bankNumber);
    if (firstDescription.isValid) {
      await openBox();
      final box = Hive.box<Database>(boxName);
      final savedDatabase = await getDatabase();

      if (savedDatabase.isNotEmpty) {
        for (var element in savedDatabase) {
          if (element.firstName == database.firstName) {
            return Description(
                isValid: false, description: "This name is already registered");
          } else if (element.lastName == database.lastName) {
            return Description(
                isValid: false,
                description: "This surname is already registered");
          } else if (element.phoneNumber == database.phoneNumber) {
            return Description(
                isValid: false,
                description: "This Phone number is already registered");
          } else if (element.email == database.email) {
            return Description(
                isValid: false,
                description: "This email is already registered");
          } else if (element.bankAccountNumber == database.bankAccountNumber) {
            return Description(
                isValid: false,
                description: "This Bank number is already registered");
          } else if (element.dateOfBirth == database.dateOfBirth) {
            return Description(
                isValid: false,
                description: "This Date of birth is already registered");
          }
        }

        await box.add(database);
        return Description(isValid: true, description: "Added successfuly");
      } else {
        await box.add(database);
        return Description(isValid: true, description: "Added successfuly");
      }
    } else {
      return Description(
          isValid: false, description: firstDescription.description);
    }
  }

}

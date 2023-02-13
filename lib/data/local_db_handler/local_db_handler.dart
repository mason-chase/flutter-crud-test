import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

import '../../shared_library/infrastructure/utils/failure.dart';
import '../dtos/customer/customer_dto.dart';

class LocalDbHandler {
  static const String customers = 'customers';
  static const String db = 'TestDb';

  static Future<BoxCollection> _openOrCreateDb() async {
    final directory = await getApplicationDocumentsDirectory();

    return BoxCollection.open(
      db,
      {customers},
      path: directory.path,
    );
  }

  Future<CollectionBox> _openCustomersBox() async {
    final collection = await _openOrCreateDb();

    return collection.openBox(customers);
  }

  Future<String> addCustomer(final CustomerDto dto) async {
    try {
      final uuid = const Uuid().v1();
      final customersBox = await _openCustomersBox();
      await _validateCustomer(dto);
      await customersBox.put(
        uuid,
        dto.toMap(uuid),
      );

      return uuid;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> _validateCustomer(final CustomerDto dto) async {
    final customersBox = await _openCustomersBox();
    final customers = await customersBox.getAllValues();
    customers.forEach((final key, final value) {
      if (value['email'] == dto.email) {
        throw Exception('Email already exists');
      }
      if (value['phoneNumber'] == dto.phoneNumber) {
        throw Exception('Mobile number already exists');
      }
    });
  }

  Future<Map<String, dynamic>> getAllCustomers() async {
    try {
      final customersBox = await _openCustomersBox();

      final Map<String, dynamic> items = await customersBox.getAllValues();
      return items;
    } on Exception catch (e) {
      throw Failure.somethingWentWrong();
    }
  }
}

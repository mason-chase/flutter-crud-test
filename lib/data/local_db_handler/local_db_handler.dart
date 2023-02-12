import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

import '../../shared_library/infrastructure/utils/failure.dart';
import '../dtos/customer/customer_dto.dart';

class LocalDbHandler {
  static const String customers = 'customers';
  static const String db = 'TestDb';

  static Future<BoxCollection> _openOrCreateDb() => BoxCollection.open(
        db,
        {customers},
      );

  Future<CollectionBox<Map>> _openCustomersBox() async {
    final collection = await _openOrCreateDb();

    return collection.openBox<Map>(customers);
  }

  Future<String> addCustomer(final CustomerDto dto) async {
    try {
      final uuid = const Uuid().v1();
      final customersBox = await _openCustomersBox();
      await customersBox.put(
        uuid,
        dto.toMap(),
      );

      return uuid;
    } on Exception catch (e) {
      throw Failure.somethingWentWrong();
    }
  }
}

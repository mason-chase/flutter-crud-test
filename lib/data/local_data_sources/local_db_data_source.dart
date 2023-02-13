import '../dtos/customer/customer_dto.dart';
import '../local_db_handler/local_db_handler.dart';

class LocalDbDataSource {
  final LocalDbHandler _localDbHandler = LocalDbHandler();

  Future<String> addCustomer(final CustomerDto dto) {
    try {
      final result = _localDbHandler.addCustomer(dto);
      return result;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<CustomerDto>> getAllCustomers() async {
    try {
      final Map<String, dynamic> items =
          await _localDbHandler.getAllCustomers();
      final List<CustomerDto> finalItems = [];
      items.forEach((final key, final value) {
        finalItems.add(CustomerDto.fromMap(Map<String, dynamic>.from(value)));
      });

      return finalItems;
    } on Exception {
      rethrow;
    }
  }
}

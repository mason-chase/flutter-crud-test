import '../dtos/customer/customer_dto.dart';
import '../local_db_handler/local_db_handler.dart';

class LocalDbDataSource {
  final LocalDbHandler _localDbHandler = LocalDbHandler();

  Future<String> addCustomer(final CustomerDto dto) {
    try {
      return _localDbHandler.addCustomer(dto);
    } on Exception {
      rethrow;
    }
  }
}

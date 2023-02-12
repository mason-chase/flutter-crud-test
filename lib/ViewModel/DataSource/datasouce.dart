import 'package:amir_crud_test/Model/DataBase/hive_database.dart';
import 'package:amir_crud_test/Model/Description/description.dart';
import 'package:amir_crud_test/ViewModel/Functions/functions.dart';
import 'package:hive_flutter/adapters.dart';

abstract class DataSource {
  Future<void> initDatabase();
  Future<Description> addToDatabase({required Database database});
  Future<List<Database>> getCustomerList();
  Future<void> closeDatabase();
  Future<Description> updateCustomer(
      {required int index, required Database database});
  Future<Description> deleteCustomer({required int index});
}

class RemoteDataSource extends DataSource {
  final Functions functions;

  RemoteDataSource(this.functions);
  @override
  Future<void> initDatabase() async {
    await Hive.initFlutter();
    Hive.registerAdapter(DatabaseAdapter());
    await functions.openBox();
  }

  @override
  Future<Description> addToDatabase({required Database database}) async {
    final Description description =
        await functions.addToBox(database: database);
    return description;
  }

  @override
  Future<List<Database>> getCustomerList() async {
    final List<Database> customerList = await functions.getDatabase();
    return customerList;
  }

  @override
  Future<void> closeDatabase() async => await functions.closeDatabase();

  @override
  Future<Description> deleteCustomer({required int index}) async =>
      await functions.deleteCustomer(index: index);

  @override
  Future<Description> updateCustomer(
          {required int index, required Database database}) async =>
      functions.updateCustomer(database: database, index: index);
}

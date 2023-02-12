import 'package:amir_crud_test/Model/Description/description.dart';
import 'package:amir_crud_test/Model/DataBase/hive_database.dart';
import 'package:amir_crud_test/ViewModel/DataSource/datasouce.dart';

class Repository extends DataSource {
  final DataSource remoteDataSource;

  Repository(this.remoteDataSource);
  @override
  Future<void> initDatabase() => remoteDataSource.initDatabase();

  @override
  Future<Description> addToDatabase({required Database database}) =>
      remoteDataSource.addToDatabase(database: database);

  @override
  Future<List<Database>> getCustomerList() =>
      remoteDataSource.getCustomerList();

  @override
  Future<void> closeDatabase() => remoteDataSource.closeDatabase();

  @override
  Future<Description> deleteCustomer({required int index}) =>
      remoteDataSource.deleteCustomer(index: index);

  @override
  Future<Description> updateCustomer(
          {required int index, required Database database}) =>
      remoteDataSource.updateCustomer(index: index, database: database);
}

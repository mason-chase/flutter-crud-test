import 'dart:async';

import 'package:floor/floor.dart';
import 'package:mc_crud_test/domain/customer/entity/customer_entity.dart';
import 'package:mc_crud_test/infrastructure/database/data_access_object/customer_dao.dart';
import 'package:mc_crud_test/injection.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [CustomerEntity])
abstract class AppDatabase extends FloorDatabase {
  static const databaseName = "app_database.db";
  static const customerTable = "customer";

  CustomerDao get customerDao;

  static Future<void> initializeDatabase() async {
    final database = await $FloorAppDatabase.databaseBuilder(databaseName).build();
    getIt.registerSingleton<AppDatabase>(database);
  }
}

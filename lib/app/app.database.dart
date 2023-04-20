import 'dart:async';

import 'package:floor/floor.dart';
import 'package:mc_crud_test/app/app.constants.dart';
import 'package:mc_crud_test/core/utils/app.utils.dart';
import 'package:mc_crud_test/features/customer/data/customer_datasource.dao.dart';
import 'package:mc_crud_test/features/customer/domain/customer.entity.dart';

import 'package:sqflite/sqflite.dart' as sqflite;
part 'app.database.g.dart';


@Database(version: 1, entities: [Customer])
abstract class AppDatabase extends FloorDatabase {
  CustomerLocalDataSource get customerLocalDataSource;


  static Future<void> initializeDatabase() async {
    final database = await $FloorAppDatabase
        .databaseBuilder(AppConstants.databaseName)
        .build();

    getIt.registerSingleton<AppDatabase>(database);
  }
}

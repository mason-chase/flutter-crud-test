
// required package imports
import 'dart:async';
import 'package:floor/floor.dart';
import 'package:mc_crud_test/core/data/data_source/local/customer_entity.dart';
import 'package:mc_crud_test/core/data/data_source/local/customer_dao.dart';

import 'package:sqflite/sqflite.dart' as sqflite;

import 'customer_entity.dart';


part 'database.g.dart'; // the generated code will be there


@Database(version: 1, entities: [CustomerEntity])
abstract class AppDatabase extends FloorDatabase {
  CustomerDao get customerDao;
}
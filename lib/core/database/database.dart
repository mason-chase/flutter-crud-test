import 'dart:async';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../constants/constants.dart';

class DatabaseProvider {
  static final DatabaseProvider dbProvider = DatabaseProvider();
  Database? _database;

  Future<Database> get database async {
    _database ??= (await initializeDatabase());
    return _database!;
  }

  Future<String> _databasePath() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'databse.db';
    return path;
  }

  Future<Database> initializeDatabase() async {
    String path = await _databasePath();
    var database = openDatabase(
      path,
      version: 1,
      onCreate: _createDb,
      onConfigure: _onConfigure,
    );
    return database;
  }

  void _onConfigure(Database db) async =>
      await db.execute('PRAGMA foreign_keys=ON');

  void onUpgrade(Database database, int oldVersion, int newVersion) {
    if (newVersion > oldVersion) {}
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute('''
      CREATE TABLE ${Constants.customerTable}(
        id TEXT PRIMARY KEY,
        firstName TEXT,
        lastName TEXT,
        email TEXT,
        phoneNumber TEXT,
        bankAccountNumber TEXT,
        dateOfBirth TEXT,
        UNIQUE(email, firstName, lastName, dateOfBirth)
      )
    ''');
  }
}

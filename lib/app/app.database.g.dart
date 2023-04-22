// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app.database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  CustomerLocalDataSource? _customerLocalDataSourceInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `customer` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `firstname` TEXT NOT NULL, `lastname` TEXT NOT NULL, `dateOfBirth` TEXT NOT NULL, `phoneNumber` TEXT NOT NULL, `email` TEXT NOT NULL, `bankAccountNumber` TEXT NOT NULL)');
        await database.execute(
            'CREATE UNIQUE INDEX `index_customer_firstname_lastname_dateOfBirth` ON `customer` (`firstname`, `lastname`, `dateOfBirth`)');
        await database.execute(
            'CREATE UNIQUE INDEX `index_customer_email` ON `customer` (`email`)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  CustomerLocalDataSource get customerLocalDataSource {
    return _customerLocalDataSourceInstance ??=
        _$CustomerLocalDataSource(database, changeListener);
  }
}

class _$CustomerLocalDataSource extends CustomerLocalDataSource {
  _$CustomerLocalDataSource(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _customerInsertionAdapter = InsertionAdapter(
            database,
            'customer',
            (Customer item) => <String, Object?>{
                  'id': item.id,
                  'firstname': item.firstname,
                  'lastname': item.lastname,
                  'dateOfBirth': item.dateOfBirth,
                  'phoneNumber': item.phoneNumber,
                  'email': item.email,
                  'bankAccountNumber': item.bankAccountNumber
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Customer> _customerInsertionAdapter;

  @override
  Future<List<Customer>> getCustomers() async {
    return _queryAdapter.queryList('SELECT * FROM customer',
        mapper: (Map<String, Object?> row) => Customer(
            id: row['id'] as int?,
            firstname: row['firstname'] as String,
            lastname: row['lastname'] as String,
            dateOfBirth: row['dateOfBirth'] as String,
            phoneNumber: row['phoneNumber'] as String,
            email: row['email'] as String,
            bankAccountNumber: row['bankAccountNumber'] as String));
  }

  @override
  Future<void> addCustomer(Customer customer) async {
    await _customerInsertionAdapter.insert(customer, OnConflictStrategy.fail);
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

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

  CustomerDao? _customerDaoInstance;

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
            'CREATE TABLE IF NOT EXISTS `CustomerEntity` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `firstName` TEXT, `lastName` TEXT, `phoneNumber` TEXT, `email` TEXT, `bankAccountNumber` TEXT, `dateOfBirth` TEXT)');
        await database.execute(
            'CREATE UNIQUE INDEX `index_CustomerEntity_firstName_lastName_dateOfBirth_email` ON `CustomerEntity` (`firstName`, `lastName`, `dateOfBirth`, `email`)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  CustomerDao get customerDao {
    return _customerDaoInstance ??= _$CustomerDao(database, changeListener);
  }
}

class _$CustomerDao extends CustomerDao {
  _$CustomerDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _customerEntityInsertionAdapter = InsertionAdapter(
            database,
            'CustomerEntity',
            (CustomerEntity item) => <String, Object?>{
                  'id': item.id,
                  'firstName': item.firstName,
                  'lastName': item.lastName,
                  'phoneNumber': item.phoneNumber,
                  'email': item.email,
                  'bankAccountNumber': item.bankAccountNumber,
                  'dateOfBirth': item.dateOfBirth
                }),
        _customerEntityUpdateAdapter = UpdateAdapter(
            database,
            'CustomerEntity',
            ['id'],
            (CustomerEntity item) => <String, Object?>{
                  'id': item.id,
                  'firstName': item.firstName,
                  'lastName': item.lastName,
                  'phoneNumber': item.phoneNumber,
                  'email': item.email,
                  'bankAccountNumber': item.bankAccountNumber,
                  'dateOfBirth': item.dateOfBirth
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<CustomerEntity> _customerEntityInsertionAdapter;

  final UpdateAdapter<CustomerEntity> _customerEntityUpdateAdapter;

  @override
  Future<List<CustomerEntity>> getAll() async {
    return _queryAdapter.queryList('SELECT * FROM CustomerEntity',
        mapper: (Map<String, Object?> row) => CustomerEntity(
            firstName: row['firstName'] as String?,
            lastName: row['lastName'] as String?,
            phoneNumber: row['phoneNumber'] as String?,
            email: row['email'] as String?,
            bankAccountNumber: row['bankAccountNumber'] as String?,
            dateOfBirth: row['dateOfBirth'] as String?));
  }

  @override
  Future<CustomerEntity?> getCustomer(int customerId) async {
    return _queryAdapter.query('SELECT * FROM CustomerEntity WHERE id =?1',
        mapper: (Map<String, Object?> row) => CustomerEntity(
            firstName: row['firstName'] as String?,
            lastName: row['lastName'] as String?,
            phoneNumber: row['phoneNumber'] as String?,
            email: row['email'] as String?,
            bankAccountNumber: row['bankAccountNumber'] as String?,
            dateOfBirth: row['dateOfBirth'] as String?),
        arguments: [customerId]);
  }

  @override
  Future<int?> deleteCustomer(String email) async {
    await _queryAdapter.queryNoReturn(
        'DELETE from CustomerEntity WHERE email = ?1',
        arguments: [email]);
  }

  @override
  Future<void> insertCustomer(CustomerEntity customer) async {
    await _customerEntityInsertionAdapter.insert(
        customer, OnConflictStrategy.abort);
  }

  @override
  Future<int> updateCustomer(CustomerEntity customer) {
    return _customerEntityUpdateAdapter.updateAndReturnChangedRows(
        customer, OnConflictStrategy.abort);
  }
}

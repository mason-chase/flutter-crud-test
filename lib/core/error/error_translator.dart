import 'package:sqflite/sqlite_api.dart';

/// convert exception to error.
class ErrorTranslator {
  String call(Object err) {
    if (err is DatabaseException) return _databaseExceptionHandler(err);
    // Todo - handle other exception types.
    return 'Something went wrong! Try again.';
  }

  String _databaseExceptionHandler(DatabaseException err) {
    if (err.isDuplicateColumnError())
      return 'Duplicate Column Error';
    else if (err.isUniqueConstraintError())
      return 'Unique Constrant Error';
    else
      return 'Database Error! Try again';
  }
}

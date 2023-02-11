import 'package:hive/hive.dart';

class LocalDbHandler {
  static Future<BoxCollection> openOrCreateDb() async {
    final collection = await BoxCollection.open(
      'TestDb',
      {'customers'},
    );
    return collection;
  }





}

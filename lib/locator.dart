

import 'package:get_it/get_it.dart';

import 'core/data/data_source/local/database.dart';

GetIt locator = GetIt.instance;

setup() async {

  final database =
  await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  locator.registerSingleton<AppDatabase>(database);


}
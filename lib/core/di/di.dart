import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../database/database.dart';
import 'di.config.dart';

final sl = GetIt.instance;

@injectableInit
Future<void> configureDependencies() async {
  String env = Environment.dev;
  if (kReleaseMode) env = Environment.prod;
  
  // @lazySingleton
  // final AppDatabase database =
  //     await $FloorAppDatabase.databaseBuilder('app_database.db').build();

  $initGetIt(sl, environment: env);
}

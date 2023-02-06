import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:mc_crud_test/application/shared/bloc_observer.dart';
import 'package:mc_crud_test/infrastructure/database/database.dart';
import 'package:mc_crud_test/injection.dart';
import 'package:mc_crud_test/presentation/app_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //set portrait
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  //initial database
  await AppDatabase.initializeDatabase();

  //set injection
  await configureInjection(Environment.dev);

  //set observer for debug bloc
  Bloc.observer = SimpleBlocObserver();

  runApp(const AppWidget());
}

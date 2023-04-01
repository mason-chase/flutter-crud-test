import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mc_crud_test/core/customer/data/datasource/customer_local_datasource.dart';
import 'package:mc_crud_test/core/customer/data/dto/customer_dto.dart';
import 'package:mc_crud_test/core/customer/domain/repository/interfaces/customer_repository_impl.dart';
import 'package:mc_crud_test/feature/customer/page/customer_add_page.dart';
import 'package:mc_crud_test/feature/customer/page/customer_detail_page.dart';
import 'package:mc_crud_test/feature/customer/page/customer_list_page.dart';
import 'package:path_provider/path_provider.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    if (bloc is Cubit) {
      if (kDebugMode) print(change);
    }
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    if (kDebugMode) print(transition);
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);
  // Registering the adapter
  Hive.registerAdapter(CustomerDTOAdapter());
  await Hive.openBox('customerBox');

  Bloc.observer = AppBlocObserver();

  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/list': (BuildContext context) => CustomerListPage(),
        '/add': (BuildContext context) => CustomerAddPage(),
        '/detail': (BuildContext context) => CustomerDetailPage(),
      },
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          secondary: Colors.purple,
          onSecondary: Colors.white,
        ),
      ),
      // home: Scaffold(
      //   body: RepositoryProvider(create: ((context) => CustomerRepositoryImpl),
      //   child: MultiBlocProvider(providers: [

      //   ]),),
      // ),
    );
  }
}

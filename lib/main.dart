import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mc_crud_test/core/customer/data/datasource/customer_local_datasource.dart';
import 'package:mc_crud_test/core/customer/data/dto/customer_dto.dart';
import 'package:mc_crud_test/core/customer/domain/repository/interfaces/customer_repository_impl.dart';
import 'package:mc_crud_test/core/customer/domain/usecase/customer/add_customer_usecase.dart';
import 'package:mc_crud_test/core/customer/domain/usecase/customer/delete_customer_usecase.dart';
import 'package:mc_crud_test/core/customer/domain/usecase/customer/get_customer_list_usecase.dart';
import 'package:mc_crud_test/core/customer/domain/usecase/customer/update_customer_usecase.dart';
import 'package:mc_crud_test/feature/customer/bloc/customer_bloc.dart';
import 'package:mc_crud_test/feature/customer/page/Home_page.dart';
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

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CustomerBloc>(
            create: (context) => CustomerBloc(
                getAllCustomersUseCase: GetAllCustomersImpl(),
                updateCustomerUseCase:
                    UpdateCustomerImpl(CustomerDTO.fromJson({}), 0),
                addCustomerUseCase: AddCustomerImpl(CustomerDTO.fromJson({})),
                deleteCustomerUseCase: DeleteCustomerImpl(0))
              ..add(GetCustomers()))
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: <String, WidgetBuilder>{
          '/home': ((context) => const HomePage()),
          '/list': (BuildContext context) => const CustomersListPage(),
          '/add': (BuildContext context) => const CustomerAddPage(),
          '/detail': (BuildContext context) => CustomerDetailPage(),
        },
        theme: ThemeData(
          colorScheme: const ColorScheme.light(
            secondary: Colors.purple,
            onSecondary: Colors.white,
          ),
        ),
        home: const HomePage(),
      ),
    );
  }
}

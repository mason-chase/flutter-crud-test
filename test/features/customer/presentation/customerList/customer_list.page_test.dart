import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mc_crud_test/app/app_routes.dart';
import 'package:mc_crud_test/features/customer/presentation/addCustomer/add_customer.page.dart';
import 'package:mc_crud_test/features/customer/presentation/customerList/bloc/customer_list.bloc.dart';
import 'package:mc_crud_test/features/customer/presentation/customerList/bloc/customer_list.event.dart';
import 'package:mc_crud_test/features/customer/presentation/customerList/bloc/customer_list.state.dart';
import 'package:mc_crud_test/features/customer/presentation/customerList/customer_list.page.dart';
import 'package:mc_crud_test/features/customer/presentation/customerList/widgets/customer_list_empty.widget.dart';
import 'package:mc_crud_test/features/customer/presentation/customerList/widgets/customer_list_error.widget.dart';
import 'package:mc_crud_test/features/customer/presentation/customerList/widgets/customer_list_loading.widget.dart';

class MockCustomerListBloc
    extends MockBloc<CustomerListEvent, CustomerListState>
    implements CustomerListBloc {}

main() {
  final bloc = MockCustomerListBloc();

  Future _loadMain(WidgetTester tester) async {
    final Map<String, WidgetBuilder> routes = {
      AppRoutes.customerList: (_) => const CustomerListPage(),
      AppRoutes.addCustomer: (_) => const AddCustomerPage(),
    };

    await tester.pumpWidget(
      MultiBlocProvider(
        providers: [BlocProvider<CustomerListBloc>.value(value: bloc)],
        child: MaterialApp(
          title: 'Flutter Demo',
          routes: routes,
          initialRoute: AppRoutes.customerList,
        ),
      ),
    );
  }

  group('CustomerListPage', () {
    testWidgets('Should show loading when states is Loading',
        (WidgetTester tester) async {
      whenListen(bloc, Stream.fromIterable([Loading()]),
          initialState: Loading());
      await _loadMain(tester);
      expect(find.byType(CustomerListLoadingWidget), findsOneWidget);
    });

    testWidgets('Should show error when states is Error',
        (WidgetTester tester) async {
      whenListen(bloc, Stream.fromIterable([Error("error when loading data ")]),
          initialState: Error("error when loading data "));
      await _loadMain(tester);
      expect(find.byType(CustomerListErrorWidget), findsOneWidget);
    });

    testWidgets('Should show empty when states is Empty',
        (WidgetTester tester) async {
      whenListen(bloc, Stream.fromIterable([Empty()]), initialState: Empty());
      await _loadMain(tester);
      expect(find.byType(CustomerListEmptyWidget), findsOneWidget);
    });

    testWidgets('Should show list when states is ListLoaded',
        (WidgetTester tester) async {
      whenListen(bloc, Stream.fromIterable([ListLoaded([])]),
          initialState: ListLoaded(const []));
      await _loadMain(tester);
      expect(find.byType(ListView), findsOneWidget);
    });

    testWidgets("should navigate to add customer page when tap on fab",
        (WidgetTester tester) async {
      whenListen(bloc, Stream.fromIterable([ListLoaded([])]),
          initialState: ListLoaded(const []));
      await _loadMain(tester);
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();
      expect(find.byType(AddCustomerPage), findsOneWidget);

    });
  });
}

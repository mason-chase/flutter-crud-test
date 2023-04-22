import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mc_crud_test/app/app_routes.dart';
import 'package:mc_crud_test/core/models/custom_field.dart';
import 'package:mc_crud_test/core/utils/app.utils.dart';
import 'package:mc_crud_test/core/utils/time.util.dart';
import 'package:mc_crud_test/features/customer/presentation/addCustomer/add_customer.page.dart';
import 'package:mc_crud_test/features/customer/presentation/addCustomer/add_customer_form_keys.dart';
import 'package:mc_crud_test/features/customer/presentation/addCustomer/bloc/add_customer.bloc.dart';
import 'package:mc_crud_test/features/customer/presentation/addCustomer/bloc/add_customer.event.dart';
import 'package:mc_crud_test/features/customer/presentation/addCustomer/bloc/add_customer.state.dart';
import 'package:mc_crud_test/features/customer/presentation/widgets/custom_button.dart';
import 'package:mocktail/mocktail.dart';

import '../../../test_injection_helper.dart';
import '../../customer_test.constants.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

main() {
  setupTestInjection();
  final bloc = getIt<AddCustomerBloc>();
  late MockNavigatorObserver navigatorObserver;
  Future _loadMain(WidgetTester tester) async {
    final Map<String, WidgetBuilder> routes = {
      AppRoutes.addCustomer: (_) => const AddCustomerPage(),
    };
    whenListen<AddCustomerState>(
        bloc,
        Stream.fromIterable(
          [const AddCustomerInitial()],
        ),
        initialState: const AddCustomerInitial());
    await tester.pumpWidget(
      MultiBlocProvider(
        providers: [BlocProvider<AddCustomerBloc>.value(value: bloc)],
        child: ScreenUtilInit(
            builder: (ctx, child) => MaterialApp(
                  title: 'Flutter Demo',
                  routes: routes,
                  initialRoute: AppRoutes.addCustomer,
                  navigatorObservers: [navigatorObserver],
                )),
      ),
    );
  }

  setUp(() {
    navigatorObserver = MockNavigatorObserver();
  });

  group('event call validation', () {
    testWidgets('verify after changing first name FistNameChanged is called',
        (WidgetTester tester) async {
      await _loadMain(tester);
      await tester.pumpAndSettle();

      await tester.enterText(
          find.byKey(AddCustomerFormKeys.firstNameKey), validFirstname);
      await tester.pumpAndSettle();

      verify(() => bloc.add(FirstnameChanged(validFirstname))).called(1);
    });

    testWidgets('verify after changing last name LastNameChanged is called',
        (WidgetTester tester) async {
      await _loadMain(tester);
      await tester.pumpAndSettle();

      await tester.enterText(
          find.byKey(AddCustomerFormKeys.lastNameKey), validLastname);
      await tester.pumpAndSettle();

      verify(() => bloc.add(LastnameChanged(validLastname))).called(1);
    });

    testWidgets('verify after changing email EmailChanged is called',
        (WidgetTester tester) async {
      await _loadMain(tester);
      await tester.pumpAndSettle();

      await tester.enterText(
          find.byKey(AddCustomerFormKeys.emailKey), validEmail);
      await tester.pumpAndSettle();

      verify(() => bloc.add(EmailChanged(validEmail))).called(1);
    });

    testWidgets('verify after changing phone PhoneChanged is called',
        (WidgetTester tester) async {
      await _loadMain(tester);
      await tester.pumpAndSettle();

      await tester.enterText(
          find.byKey(AddCustomerFormKeys.phoneKey), validPhone);
      await tester.pumpAndSettle();

      verify(() => bloc.add(PhoneChanged(validPhone))).called(1);
    });

    // bank account
    testWidgets(
        'verify after changing bank account BankAccountChanged is called',
        (WidgetTester tester) async {
      await _loadMain(tester);
      await tester.pumpAndSettle();

      await tester.enterText(
          find.byKey(AddCustomerFormKeys.bankAccountKey), validBankAccount);
      await tester.pumpAndSettle();

      verify(() => bloc.add(BankAccountChanged(validBankAccount))).called(1);
    });

    // date of birth
    testWidgets(
        'verify after changing date of birth DateOfBirthChanged is called',
        (WidgetTester tester) async {
      await _loadMain(tester);
      await tester.pumpAndSettle();
      await tester.ensureVisible(find.byType(CupertinoDatePicker));
      await tester.tap(find.byType(CupertinoDatePicker));
      await tester.pump();
      var dateTime = DateTime.now();
      var day = TimeUtil.getDayFromDateTime(dateTime);
      final dayFinder = find.text(day).last;
      await tester.ensureVisible(dayFinder);
      // Apply an offset to scroll
      const offset = Offset(0, -10000);

      // Use both methods: fling and drag
      await tester.fling(
        dayFinder,
        offset,
        1000,
        warnIfMissed: false,
      );

      await tester.drag(
        dayFinder,
        offset,
        warnIfMissed: false,
      );
      var newDate = DateTime(dateTime.year, dateTime.month, dateTime.day + 1);
      verify(() => bloc.add(DateOfBirthChanged(newDate)));
    });
  });

  group('form validation', () {
    testWidgets('verify first name validation', (WidgetTester tester) async {
      await _loadMain(tester);
      when(() => bloc.state)
          .thenAnswer((invocation) => const AddCustomerInitial().copyWith(
                  firstname: const CustomFiled(
                value: invalidFirstname,
                state: FieldState.invalid,
                errorMessage: 'Invalid name',
              )));
      await tester.enterText(
          find.byKey(AddCustomerFormKeys.firstNameKey), invalidFirstname);
      await tester.pumpAndSettle();

      //

      expect(find.text(bloc.state.firstname.errorMessage!), findsWidgets);
    });

    testWidgets('verify last name validation', (WidgetTester tester) async {
      await _loadMain(tester);
      when(() => bloc.state)
          .thenAnswer((invocation) => const AddCustomerInitial().copyWith(
                  lastname: const CustomFiled(
                value: invalidLastname,
                state: FieldState.invalid,
                errorMessage: 'Invalid name',
              )));
      await tester.enterText(
          find.byKey(AddCustomerFormKeys.lastNameKey), invalidLastname);
      await tester.pumpAndSettle();

      //

      expect(find.text(bloc.state.lastname.errorMessage!), findsWidgets);
    });

    testWidgets('verify email validation', (WidgetTester tester) async {
      await _loadMain(tester);
      when(() => bloc.state)
          .thenAnswer((invocation) => const AddCustomerInitial().copyWith(
                  email: const CustomFiled(
                value: invalidEmail,
                state: FieldState.invalid,
                errorMessage: 'Invalid email',
              )));
      await tester.enterText(
          find.byKey(AddCustomerFormKeys.emailKey), invalidEmail);
      await tester.pumpAndSettle();

      //

      expect(find.text(bloc.state.email.errorMessage!), findsWidgets);
    });

    testWidgets('verify phone validation', (WidgetTester tester) async {
      await _loadMain(tester);
      when(() => bloc.state)
          .thenAnswer((invocation) => const AddCustomerInitial().copyWith(
                  phone: const CustomFiled(
                value: invalidPhone,
                state: FieldState.invalid,
                errorMessage: 'Invalid phone',
              )));
      await tester.enterText(
          find.byKey(AddCustomerFormKeys.phoneKey), invalidPhone);
      await tester.pumpAndSettle();

      //

      expect(find.text(bloc.state.phone.errorMessage!), findsWidgets);
    });

    testWidgets('verify bank account validation', (WidgetTester tester) async {
      await _loadMain(tester);
      when(() => bloc.state)
          .thenAnswer((invocation) => const AddCustomerInitial().copyWith(
                  bankAccount: const CustomFiled(
                value: invalidBankAccount,
                state: FieldState.invalid,
                errorMessage: 'Invalid bank account',
              )));
      await tester.enterText(
          find.byKey(AddCustomerFormKeys.bankAccountKey), invalidBankAccount);
      await tester.pumpAndSettle();

      //

      expect(find.text(bloc.state.bankAccount.errorMessage!), findsWidgets);
    });
  });

  group('form submit', () {
    testWidgets('verify submit button is disabled when form is invalid',
        (WidgetTester tester) async {
      await _loadMain(tester);

      expect(
          tester
              .widget<CustomButton>(
                  find.byKey(AddCustomerFormKeys.submitButtonKey))
              .enable,
          false);
    });
    testWidgets(
        'verify submit button is disabled when even one of the fields is invalid',
        (WidgetTester tester) async {
      await _loadMain(tester);

      await tester.enterText(
          find.byKey(AddCustomerFormKeys.bankAccountKey), invalidBankAccount);
      await tester.pumpAndSettle();
      expect(
          tester
              .widget<CustomButton>(
                  find.byKey(AddCustomerFormKeys.submitButtonKey))
              .enable,
          false);
    });
  });
}

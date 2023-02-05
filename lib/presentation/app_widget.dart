import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mc_crud_test/application/customer/get_all_customer/get_all_customer_cubit.dart';
import 'package:mc_crud_test/presentation/routing/routing.dart';
import 'package:mc_crud_test/presentation/theme/theme_config.dart';

import '../injection.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<GetAllCustomerCubit>()..getAllCustomer(),
      child: ScreenUtilInit(
        builder: (ctx, child) => MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Mason Chase',
          theme: getIt<ThemeConfig>().themeData(),
          routerConfig: getIt<Routing>().router,
          builder: (BuildContext context, Widget? child) {
            final MediaQueryData data = MediaQuery.of(context);
            return MediaQuery(
              data: data.copyWith(textScaleFactor: 1),
              child: child!,
            );
          },
        ),
      ),
    );
  }
}

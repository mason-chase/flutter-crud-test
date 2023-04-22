import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mc_crud_test/app/app_routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (ctx, child) => MaterialApp(
        title: 'Flutter Demo',
        routes: AppRoutes.getRoutes(context),
        initialRoute: AppRoutes.customerList,
      ),
    );
  }
}

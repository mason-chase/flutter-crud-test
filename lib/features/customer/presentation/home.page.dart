import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mc_crud_test/features/app/app_routes.dart';
import 'package:mc_crud_test/features/app/theme/app.color.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (ctx, child) => MaterialApp(
        title: 'Flutter Demo',
        routes: AppRoutes.getRoutes(context),
        initialRoute: AppRoutes.customerList,
        theme: ThemeData(
          primarySwatch: AppColors.warningColor,
        ),
      ),
    );
  }
}

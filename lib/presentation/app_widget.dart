import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../injection.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (ctx, child) => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Mason Chase',
        // theme: getIt<ThemeConfig>().themeData(),
        // routerConfig: getIt<Routing>().router,
        builder: (BuildContext context, Widget? child) {
          final MediaQueryData data = MediaQuery.of(context);
          return MediaQuery(
            data: data.copyWith(textScaleFactor: 1),
            child: child!,
          );
        },
      ),
    );
  }
}

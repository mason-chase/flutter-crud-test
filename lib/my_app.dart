import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'feature/pages/not_found_page/views/not_found_page.dart';
import 'shared_library/infrastructure/routes/pages.dart';
import 'shared_library/infrastructure/routes/route_paths.dart';
import 'shared_library/infrastructure/styles/test_app_theme_data.dart';

class MyApp extends StatelessWidget {
  const MyApp({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) => GetMaterialApp(
        title: 'Flutter Test App',
        debugShowCheckedModeBanner: false,
        theme: TestAppThemeData.appThemeData,
        unknownRoute: GetPage(
          name: RoutePaths.notFoundPage,
          page: NotFoundPage.new,
        ),
        defaultTransition:
            kIsWeb ? Transition.noTransition : Transition.leftToRightWithFade,
        getPages: TestAppPages.pages,
        initialRoute: RoutePaths.customerListPage,
      );
}

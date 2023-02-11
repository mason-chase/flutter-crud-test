import 'package:get/get.dart';

import '../../../feature/pages/not_found_page/views/not_found_page.dart';
import '../../../feature/pages/user/user_list_page/views/user_list_page.dart';
import 'route_paths.dart';

class TestAppPages {
  static final pages = [
    GetPage(
      name: RoutePaths.userListPage,
      page: UserListPage.new,
    ),
    GetPage(
      name: RoutePaths.notFoundPage,
      page: NotFoundPage.new,
    ),
  ];
}

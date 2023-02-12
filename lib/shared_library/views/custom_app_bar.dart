import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../infrastructure/routes/route_title_map.dart';
import '../infrastructure/utils/utils.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) => AppBar(
        elevation: 0,
        backgroundColor: Get.theme.colorScheme.primary,
        centerTitle: true,
        title: Text(
          _getRouteTitle() ?? '-',
          style: Get.textTheme.caption,
        ),
      );

  String? _getRouteTitle() => RouteTitleMap.titleMap[Get.currentRoute];

  @override
  Size get preferredSize => Utils.appBarSize;
}

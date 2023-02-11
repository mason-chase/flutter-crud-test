import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../shared_library/views/custom_app_bar.dart';
import '../../../../../shared_library/views/max_body_widget.dart';

class UserListPage extends StatelessWidget {
  const UserListPage({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) => Scaffold(
        appBar: const CustomAppBar(),
        body: MaxWidthWidget(
          child: Center(
            child: Text(
              'user-list',
              style: Get.textTheme.caption,
            ),
          ),
        ),
      );
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../infrastructure/styles/test_app_theme_data.dart';
import '../models/page_status_enum.dart';

class PageStatusWidget extends StatelessWidget {
  final Rx<PageStatusEnum> statusApi;
  final void Function()? onRetry;
  final Widget? loading;
  final Color retryButtonColor;
  final Widget content;
  final Widget? retry;

  const PageStatusWidget({
    required this.statusApi,
    required this.content,
    this.retryButtonColor = TestAppThemeData.primarySwatch,
    this.onRetry,
    this.loading,
    this.retry,
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(final BuildContext context) => buildObx();

  Widget buildObx() => Obx(() {
        switch (statusApi.value) {
          case PageStatusEnum.loading:
            {
              return loading ?? _loading();
            }

          case PageStatusEnum.retry:
            {
              return retry ?? _refreshButton();
            }
          case PageStatusEnum.success:
            {
              return content;
            }
        }
      });

  Widget _loading() => const Center(
        child: CircularProgressIndicator(),
      );

  Widget _refreshButton() => Center(
        child: IconButton(
          onPressed: onRetry,
          icon: const Icon(Icons.refresh),
        ),
      );
}

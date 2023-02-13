import 'package:flutter/material.dart';

import '../infrastructure/utils/utils.dart';

class DoubleChildWidget extends StatelessWidget {
  final Widget first;
  final Widget? second;
  final bool showPadding;

  const DoubleChildWidget({
    required this.first,
    this.second,
    this.showPadding = true,
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(final BuildContext context) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: first),
          if (showPadding) Utils.mediumHorizontalSpace,
          Expanded(child: second ?? const SizedBox()),
        ],
      );
}

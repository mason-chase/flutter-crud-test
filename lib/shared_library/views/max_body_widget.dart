import 'package:flutter/material.dart';

import '../infrastructure/utils/screen_sizes.dart';

class MaxWidthWidget extends StatelessWidget {
  final double maxWidth;
  final Widget child;

  const MaxWidthWidget(
      {required this.child,
      this.maxWidth = ScreenSizes.largeWidth,
      final Key? key})
      : super(key: key);

  @override
  Widget build(final BuildContext context) => Align(
    alignment: Alignment.topCenter,
    child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: maxWidth,
          ),
          child: child,
        ),
  );
}

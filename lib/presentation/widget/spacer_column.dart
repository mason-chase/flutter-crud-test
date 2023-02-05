import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mc_crud_test/presentation/core/extension.dart';
import 'package:mc_crud_test/presentation/theme/theme_config.dart';

class SpacerColumn extends StatelessWidget {
  final List<Widget> children;
  final EdgeInsets? padding;
  final bool hideKeyboard;

  const SpacerColumn({
    Key? key,
    required this.children,
    this.padding,
    this.hideKeyboard = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: hideKeyboard ? () => context.hideKeyboard() : null,
      child: Padding(
        padding: padding ??
            EdgeInsets.symmetric(
              vertical: ThemeConfig.appVerticalPadding.h,
              horizontal: ThemeConfig.appHorizontalPadding.w,
            ),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: children,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

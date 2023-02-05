import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mc_crud_test/presentation/core/extension.dart';
import 'package:mc_crud_test/presentation/theme/theme_config.dart';
import 'package:mc_crud_test/presentation/widget/spacer_column.dart';

class SpacerColumnWithFixedSubmitColumn extends StatelessWidget {
  final List<Widget> children;
  final Widget submitButton;
  final EdgeInsets? padding;
  final bool hideKeyboard;

  const SpacerColumnWithFixedSubmitColumn({
    Key? key,
    required this.children,
    required this.submitButton,
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
        child: Column(
          children: [
            Expanded(
              child: SpacerColumn(
                padding: const EdgeInsets.only(bottom: 20),
                children: children,
              ),
            ),
            submitButton,
          ],
        ),
      ),
    );
  }
}

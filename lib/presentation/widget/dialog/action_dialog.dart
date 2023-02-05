import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hero_button/hero_button.dart';
import 'package:mc_crud_test/presentation/theme/colory.dart';
import 'package:mc_crud_test/presentation/theme/theme_config.dart';

class ActionDialog extends StatelessWidget {
  final VoidCallback onAction;
  final String actionTitle;
  final String header;
  final String title;
  final String? description;
  final bool haveBackButton;
  final bool automaticallyCloseDialog;

  const ActionDialog({
    Key? key,
    required this.onAction,
    required this.actionTitle,
    required this.header,
    required this.title,
    this.description,
    this.haveBackButton = true,
    this.automaticallyCloseDialog = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 10,
      insetPadding: EdgeInsets.symmetric(
        horizontal: ThemeConfig.appHorizontalPadding.w,
        vertical: ThemeConfig.appVerticalPadding.h,
      ),
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(ThemeConfig.appBorderRadius.r),
      ),
      child: Padding(
        padding: const EdgeInsets.all(ThemeConfig.dialogPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(header, style: Theme.of(context).textTheme.displaySmall),
            const SizedBox(height: 16),
            Text(title, style: Theme.of(context).textTheme.headlineSmall),
            if (description != null)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  description!,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colory.neutralColor.shade400,
                        fontWeight: FontWeight.w400,
                      ),
                ),
              ),
            const SizedBox(height: ThemeConfig.dialogPadding),
            HeroButton(
              onPressed: () {
                if (automaticallyCloseDialog) {
                  //close the dialog
                  Navigator.of(context).pop(true);
                }
                onAction();
              },
              title: actionTitle,
            ),
            const SizedBox(height: 8),
            if (haveBackButton)
              HeroButton(
                onPressed: () => Navigator.of(context).pop(),
                title: "Cancel",
                childColor: Colory.primaryColor,
                buttonColor: Colory.primaryColor.shade100,
              ),
          ],
        ),
      ),
    );
  }
}

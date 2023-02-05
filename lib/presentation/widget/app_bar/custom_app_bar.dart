import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mc_crud_test/presentation/theme/icony.dart';
import 'package:mc_crud_test/presentation/theme/theme_config.dart';
import 'package:mc_crud_test/presentation/widget/app_bar/custom_app_bar_back_button.dart';
import 'package:mc_crud_test/presentation/widget/app_bar/custom_app_bar_title.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color backgroundColor;
  final String? title;
  final String? icon;
  final Color? iconColor;
  final CustomAppBarBackButton? backButton;
  final VoidCallback? onBackButtonPressed;

  const CustomAppBar({
    Key? key,
    this.title,
    this.icon,
    this.iconColor,
    this.backButton,
    this.onBackButtonPressed,
    this.backgroundColor = Colors.transparent,
  })  : assert(title == null || icon == null, 'you must have title or icon'),
        super(key: key);

  const CustomAppBar.logo({
    Key? key,
    Color? iconColor,
  }) : this(
          key: key,
          icon: Icony.appLogo,
          iconColor: iconColor,
        );

  CustomAppBar.withTitleAndBackButton({
    Key? key,
    required String title,
    VoidCallback? onBackButtonPressed,
  }) : this(
          key: key,
          title: title,
          backButton: CustomAppBarBackButton(
            onBackButtonPressed: onBackButtonPressed,
          ),
        );

  CustomAppBar.withLogoAndBackButton({
    Key? key,
    VoidCallback? onBackButtonPressed,
    Color? iconColor,
  }) : this(
          key: key,
          icon: Icony.appLogo,
          iconColor: iconColor,
          backButton: CustomAppBarBackButton(
            onBackButtonPressed: onBackButtonPressed,
          ),
        );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: backButton != null ? 0 : ThemeConfig.appHorizontalPadding.w,
        right: backButton != null ? 0 : ThemeConfig.appHorizontalPadding.w,
        top: 6.h,
      ),
      child: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        centerTitle: true,
        title: CustomAppBarTitle(icon: icon, title: title, iconColor: iconColor),
        leading: backButton,
      ),
    );
  }

  @override
  Size get preferredSize => Size(1.sw, 60.h);
}

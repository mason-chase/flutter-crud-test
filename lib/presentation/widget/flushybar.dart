import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mc_crud_test/domain/shared/enum/flush_bar_type_enum.dart';
import 'package:mc_crud_test/presentation/theme/theme_config.dart';

@lazySingleton
class FlushyBar {
  Flushbar _flushbar;

  FlushyBar(this._flushbar);

  void showFlushyBar({
    required BuildContext context,
    required String title,
    required FlushBarType flushBarType,
    VoidCallback? onActionAfterDismiss,
    int showTimeInMilliSecond = 2000,
  }) {
    if (_flushbar.isShowing()) {
      _flushbar.dismiss(context);
    }
    _flushbar = Flushbar(
      flushbarPosition: FlushbarPosition.BOTTOM,
      blockBackgroundInteraction: true,
      onStatusChanged: onActionAfterDismiss != null
          ? (status) {
              if (status == FlushbarStatus.DISMISSED) {
                onActionAfterDismiss();
              }
            }
          : null,
      duration: Duration(milliseconds: showTimeInMilliSecond),
      borderRadius: BorderRadius.circular(8.r),
      icon: SvgPicture.asset(flushBarType.icon, color: Colors.white),
      backgroundColor: flushBarType.color,
      dismissDirection: FlushbarDismissDirection.VERTICAL,
      padding: EdgeInsets.symmetric(vertical: 18.h),
      margin: EdgeInsets.symmetric(
        horizontal: ThemeConfig.appHorizontalPadding.w,
        vertical: ThemeConfig.appVerticalPadding.h,
      ),
      animationDuration: const Duration(milliseconds: 500),
      messageText: Text(
        title,
        style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.white),
      ),
    );
    _flushbar.show(context);
  }
}

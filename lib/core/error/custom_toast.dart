import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:flutter/material.dart';

class CustomToast {
  static toast(
    BuildContext context,
    String message, {
    Duration? duration,
  }) {
    showToast(message,
        context: context,
        animation: StyledToastAnimation.slideFromTop,
        reverseAnimation: StyledToastAnimation.slideToTop,
        position: StyledToastPosition.top,
        startOffset: const Offset(0.0, -3.0),
        reverseEndOffset: const Offset(0.0, -3.0),
        duration: duration ?? const Duration(seconds: 4),
        animDuration: const Duration(seconds: 1),
        curve: Curves.elasticOut,
        reverseCurve: Curves.fastOutSlowIn);
  }

  CustomToast._();
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mc_crud_test/features/app/theme/app.color.dart';

class CustomTextFieldContainer extends StatelessWidget {
  final Widget child;
  final Color? fillColor;
  final double borderRadius;
  final bool isError;

  const CustomTextFieldContainer({
    Key? key,
    required this.child,
    required this.borderRadius,
    required this.fillColor,
    required this.isError,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      decoration: ShapeDecoration(
        color: fillColor ?? Colors.black12,
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius.r),
          side: BorderSide(
            color: isError ? AppColors.warningColor.shade400 : AppColors.neutralColor.shade200,
            width: isError ? 2 : 1,
          ),
        ),
      ),
      child: child,
    );
  }
}

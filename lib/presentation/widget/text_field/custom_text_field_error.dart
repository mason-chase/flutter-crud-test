import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mc_crud_test/presentation/theme/colory.dart';
import 'package:mc_crud_test/presentation/theme/icony.dart';

class CustomTextFieldError extends StatelessWidget {
  final String? errorMessage;

  const CustomTextFieldError(this.errorMessage, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 250),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return FadeTransition(opacity: animation, child: child);
      },
      child: errorMessage != null && errorMessage!.isNotEmpty
          ? Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: SizedBox(
                height: 20.r,
                child: Row(
                  children: [
                    SvgPicture.asset(
                      Icony.closeCircle,
                      color: Colory.dangerColor.shade400,
                    ),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        errorMessage!,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Colory.dangerColor.shade400,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          : const SizedBox.shrink(),
    );
  }
}

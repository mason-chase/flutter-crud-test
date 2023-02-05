import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MultipleContainerOnTopEachOther extends StatelessWidget {
  final double biggestContainerSize;
  final List<Color> colors;
  final double sizeInterval;
  final String? centerIcon;
  final double centerIconPadding;
  final Color? iconColor;

  const MultipleContainerOnTopEachOther({
    Key? key,
    required this.biggestContainerSize,
    required this.colors,
    this.sizeInterval = 18,
    this.centerIconPadding = 12,
    this.centerIcon,
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      fit: StackFit.loose,
      children: List.generate(
        colors.length,
            (index) {
          return Container(
            height: (biggestContainerSize - (index * sizeInterval)).r,
            width: (biggestContainerSize - (index * sizeInterval)).r,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: colors[index],
            ),
            child: centerIcon != null
                ? Padding(
              padding: EdgeInsets.all(centerIconPadding.r),
              child: SvgPicture.asset(
                centerIcon!,
                width: double.infinity,
                height: double.infinity,
                color: iconColor,
              ),
            )
                : const SizedBox.shrink(),
          );
        },
      ),
    );
  }
}
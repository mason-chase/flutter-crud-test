import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mc_crud_test/presentation/theme/colory.dart';

class CustomAppBarTitle extends StatelessWidget {
  final String? title;
  final String? icon;
  final Color? iconColor;

  const CustomAppBarTitle({
    Key? key,
    required this.title,
    required this.icon,
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (title != null) {
      return Text(
        title!,
        style: Theme.of(context).textTheme.headlineLarge,
      );
    } else if (icon != null) {
      return SvgPicture.asset(
        icon!,
        color: iconColor ?? Colory.primaryColor.shade400,
        height: kToolbarHeight / 2.5,
      );
    }
    return const SizedBox.shrink();
  }
}

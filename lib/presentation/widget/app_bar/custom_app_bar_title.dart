import 'package:flutter/material.dart';
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
      return Image.asset(
        icon!,
        color: iconColor ?? Colory.primaryColor.shade400,
        height: kToolbarHeight ,
      );
    }
    return const SizedBox.shrink();
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mc_crud_test/presentation/theme/icony.dart';

class CustomAppBarBackButton extends StatelessWidget {
  final Color iconColor;
  final VoidCallback? onBackButtonPressed;

  const CustomAppBarBackButton({
    Key? key,
    this.iconColor = Colors.black,
    this.onBackButtonPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
        if (onBackButtonPressed != null) {
          onBackButtonPressed!();
        }
      },
      icon: SvgPicture.asset(
        Icony.arrowLeft,
        color: iconColor,
      ),
    );
  }
}

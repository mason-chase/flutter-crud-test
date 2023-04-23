import 'package:flutter/material.dart';
import 'package:mc_crud_test/features/app/theme/app.color.dart';

class CustomButton extends StatelessWidget {
  final double? height, width, fontSize;
  final String title;
  final bool? loading;
  final VoidCallback? onTap;
  final Color? color, textColor, disableColor;
  final bool enable;

  const CustomButton({
    Key? key,
    required this.title,
    this.loading,
    this.fontSize = 24,
    this.height = 55,
    this.width,
    this.onTap,
    this.color,
    this.textColor,
    this.disableColor = Colors.grey,
    this.enable = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: !enable || loading == true ? null : onTap,
      child: Container(
        height: height,
        width: width ?? MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color:enable ? color ?? AppColors.warningColor : disableColor,
          borderRadius: BorderRadius.circular(12),
        ),
        alignment: AlignmentDirectional.center,
        child: loading == true
            ? const SizedBox(
                height: 25,
                width: 25,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2.5,
                ),
              )
            : Text(
                title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Colors.white,
                ),
              ),
      ),
    );
  }
}

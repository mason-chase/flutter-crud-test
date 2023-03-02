import 'package:flutter/material.dart';
import 'custom_on_click.dart';

class CustomButton extends StatelessWidget {
  final double? height, width, fontSize;
  final String title;
  final bool? loading;
  final VoidCallback? onTap;
  final Color? color, textColor;
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
    this.enable = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OnClick(
      onTap: !enable || loading == true ? null : onTap,
      child: Container(
        height: height,
        width: width ?? MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: color ?? Colors.blueAccent,
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
                style: TextStyle(
                  color: textColor ?? Colors.white,
                  letterSpacing: 2,
                  fontSize: fontSize,
                ),
              ),
      ),
    );
  }
}

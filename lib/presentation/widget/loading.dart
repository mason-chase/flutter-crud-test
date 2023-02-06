import 'package:flutter/material.dart';
import 'package:mc_crud_test/presentation/theme/colory.dart';

class Loading extends StatelessWidget {
  final double? size;
  final double? strokeWidth;
  final Color? color;
  final Color? backgroundColor;

  const Loading({
    Key? key,
    this.size,
    this.strokeWidth,
    this.color,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size ?? double.infinity,
      width: size ?? double.infinity,
      child: Align(
        child: CircularProgressIndicator(
          strokeWidth: strokeWidth ?? 4,
          color: color,
          backgroundColor: backgroundColor ?? Colory.primaryColor.shade100,
        ),
      ),
    );
  }
}
